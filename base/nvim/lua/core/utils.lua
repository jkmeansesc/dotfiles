---@diagnostic disable: deprecated
local M = {}
local merge_tb = vim.tbl_deep_extend

--- get the bufnr of all opened buffers
---@author kikito
---@see https://codereview.stackexchange.com/questions/268130/get-list-of-buffers-from-current-neovim-instance
function M.get_listed_buffers()
  local buffers = {}
  local len = 0
  for buffer = 1, vim.fn.bufnr "$" do
    if vim.fn.buflisted(buffer) == 1 then
      len = len + 1
      buffers[len] = buffer
    end
  end
  return buffers
end

-- copied from NvChad
function M.load_mappings(section, mapping_opt)
  vim.schedule(function()
    local function set_section_map(section_values)
      if section_values.plugin then return end

      section_values.plugin = nil

      for mode, mode_values in pairs(section_values) do
        local default_opts = merge_tb("force", { mode = mode }, mapping_opt or {})
        for keybind, mapping_info in pairs(mode_values) do
          -- merge default + user opts
          local opts = merge_tb("force", default_opts, mapping_info.opts or {})

          mapping_info.opts, opts.mode = nil, nil
          opts.desc = mapping_info[2]

          vim.keymap.set(mode, keybind, mapping_info[1], opts)
        end
      end
    end

    local mappings = require "core.mappings"

    if type(section) == "string" then
      mappings[section]["plugin"] = nil
      mappings = { mappings[section] }
    end

    for _, sect in pairs(mappings) do
      set_section_map(sect)
    end
  end)
end

-- Copied from LazyVim
---@alias lsp.Client.filter {id?: number, bufnr?: number, name?: string, method?: string, filter?:fun(client: lsp.Client):boolean}
---@param opts? lsp.Client.filter
function M.get_clients(opts)
  local ret = {} ---@type lsp.Client[]
  if vim.lsp.get_clients then
    ret = vim.lsp.get_clients(opts)
  else
    ---@diagnostic disable-next-line: deprecated
    ret = vim.lsp.get_active_clients(opts)
    if opts and opts.method then
      ---@param client lsp.Client
      ret = vim.tbl_filter(function(client) return client.supports_method(opts.method, { bufnr = opts.bufnr }) end, ret)
    end
  end
  return opts and opts.filter and vim.tbl_filter(opts.filter, ret) or ret
end

--- Copied from Astronvim
--- Check if a plugin is defined in lazy. Useful with lazy loading when a plugin is not necessarily loaded yet
---@param plugin string The plugin to search for
---@return boolean available # Whether the plugin is available
function M.is_available(plugin)
  local lazy_config_avail, lazy_config = pcall(require, "lazy.core.config")
  return lazy_config_avail and lazy_config.spec.plugins[plugin] ~= nil
end

--- Copied from Astronvim
--- Check if a buffer is valid
---@param bufnr number? The buffer to check, default to current buffer
---@return boolean # Whether the buffer is valid or not
function M.is_valid(bufnr)
  if not bufnr then bufnr = 0 end
  return vim.api.nvim_buf_is_valid(bufnr) and vim.bo[bufnr].buflisted
end

-- Copied from Astronvim
--- Get the first worktree that a file belongs to
---@param file string? the file to check, defaults to the current file
---@param worktrees table<string, string>[]? an array like table of worktrees with entries `toplevel` and `gitdir`, default retrieves from `vim.g.git_worktrees`
---@return table<string, string>|nil # a table specifying the `toplevel` and `gitdir` of a worktree or nil if not found
function M.file_worktree(file, worktrees)
  worktrees = worktrees or vim.g.git_worktrees
  if not worktrees then return end
  file = file or vim.fn.expand "%"
  for _, worktree in ipairs(worktrees) do
    if
      M.cmd({
        "git",
        "--work-tree",
        worktree.toplevel,
        "--git-dir",
        worktree.gitdir,
        "ls-files",
        "--error-unmatch",
        file,
      }, false)
    then
      return worktree
    end
  end
end

-- Copied from Astronvim
--- Run a shell command and capture the output and if the command succeeded or failed
---@param cmd string|string[] The terminal command to execute
---@param show_error? boolean Whether or not to show an unsuccessful command as an error to the user
---@return string|nil # The result of a successfully executed command or nil
function M.cmd(cmd, show_error)
  if type(cmd) == "string" then cmd = { cmd } end
  if vim.fn.has "win32" == 1 then cmd = vim.list_extend({ "cmd.exe", "/C" }, cmd) end
  local result = vim.fn.system(cmd)
  local success = vim.api.nvim_get_vvar "shell_error" == 0
  if not success and (show_error == nil or show_error) then
    vim.api.nvim_err_writeln(("Error running command %s\nError message:\n%s"):format(table.concat(cmd, " "), result))
  end
  return success and result:gsub("[\27\155][][()#;?%d]*[A-PRZcf-ntqry=><~]", "") or nil
end

-- Copied from Astronvim
--- Helper function to check if any active LSP clients given a filter provide a specific capability
---@param capability string The server capability to check for (example: "documentFormattingProvider")
---@param filter vim.lsp.get_active_clients.filter|nil (table|nil) A table with
---              key-value pairs used to filter the returned clients.
---              The available keys are:
---               - id (number): Only return clients with the given id
---               - bufnr (number): Only return clients attached to this buffer
---               - name (string): Only return clients with the given name
---@return boolean # Whether or not any of the clients provide the capability
function M.has_capability(capability, filter)
  for _, client in ipairs(vim.lsp.get_clients(filter)) do
    if client.supports_method(capability) then return true end
  end
  return false
end

function M.add_buffer_autocmd(augroup, bufnr, autocmds)
  if not vim.tbl_islist(autocmds) then autocmds = { autocmds } end
  local cmds_found, cmds = pcall(vim.api.nvim_get_autocmds, { group = augroup, buffer = bufnr })
  if not cmds_found or vim.tbl_isempty(cmds) then
    vim.api.nvim_create_augroup(augroup, { clear = false })
    for _, autocmd in ipairs(autocmds) do
      local events = autocmd.events
      autocmd.events = nil
      autocmd.group = augroup
      autocmd.buffer = bufnr
      vim.api.nvim_create_autocmd(events, autocmd)
    end
  end
end

function M.del_buffer_autocmd(augroup, bufnr)
  local cmds_found, cmds = pcall(vim.api.nvim_get_autocmds, { group = augroup, buffer = bufnr })
  if cmds_found then vim.tbl_map(function(cmd) vim.api.nvim_del_autocmd(cmd.id) end, cmds) end
end

function M.on_attach(client, bufnr)
  client.server_capabilities.documentFormattingProvider = false
  client.server_capabilities.documentRangeFormattingProvider = false

  -- load unconditional lsp keymaps
  M.load_mappings "lspconfig"

  if client.supports_method "textDocument/codeAction" then
    vim.keymap.set(
      "n",
      "<leader>la",
      function() vim.lsp.buf.code_action() end,
      { desc = "LSP code action", noremap = true, silent = true }
    )
    vim.keymap.set(
      "v",
      "<leader>la",
      function() vim.lsp.buf.code_action() end,
      { desc = "LSP code action", noremap = true, silent = true }
    )
  end

  if client.supports_method "textDocument/codeLens" then
    M.add_buffer_autocmd("lsp_codelens_refresh", bufnr, {
      events = { "InsertLeave", "BufEnter" },
      desc = "Refresh codelens",
      callback = function()
        if not M.has_capability("textDocument/codeLens", { bufnr = bufnr }) then
          M.del_buffer_autocmd("lsp_codelens_refresh", bufnr)
          return
        end
        if vim.g.codelens_enabled then vim.lsp.codelens.refresh() end
      end,
    })
    if vim.g.codelens_enabled then vim.lsp.codelens.refresh() end
    vim.keymap.set(
      "n",
      "<leader>ll",
      function() vim.lsp.codelens.refresh() end,
      { desc = "LSP CodeLens refresh", noremap = true, silent = true }
    )

    vim.keymap.set(
      "n",
      "<leader>lL",
      function() vim.lsp.codelens.run() end,
      { desc = "LSP CodeLens run", noremap = true, silent = true }
    )
  end

  if client.supports_method "textDocument/declaration" then
    vim.keymap.set(
      "n",
      "gD",
      function() vim.lsp.buf.declaration() end,
      { desc = "LSP declaration", noremap = true, silent = true }
    )
  end

  if client.supports_method "textDocument/definition" then
    vim.keymap.set(
      "n",
      "gd",
      function() require("telescope.builtin").lsp_definitions() end,
      { desc = "LSP definition", noremap = true, silent = true }
    )
  end

  if client.supports_method "textDocument/formatting" then
    vim.keymap.set(
      "n",
      "<leader>lf",
      function() vim.lsp.buf.format(M.format_opts) end,
      { desc = "Format buffer", noremap = true, silent = true }
    )
    vim.keymap.set(
      "v",
      "<leader>lf",
      function() vim.lsp.buf.format(M.format_opts) end,
      { desc = "Format buffer", noremap = true, silent = true }
    )
  end

  if client.supports_method "textDocument/implementation" then
    vim.keymap.set(
      "n",
      "gi",
      function() require("telescope.builtin").lsp_implementations() end,
      { desc = "LSP implementation", noremap = true, silent = true }
    )
  end

  if client.supports_method "textDocument/references" then
    vim.keymap.set(
      "n",
      "gr",
      function() require("telescope.builtin").lsp_references() end,
      { desc = "LSP references", noremap = true, silent = true }
    )
  end

  if client.supports_method "textDocument/rename" then
    require("inc_rename").setup()
    vim.keymap.set(
      "n",
      "<leader>lr",
      function() return ":IncRename " .. vim.fn.expand "<cword>" end,
      { desc = "LSP rename", noremap = true, silent = true }
    )
  end

  if client.supports_method "textDocument/signatureHelp" then
    vim.keymap.set(
      "n",
      "<leader>lh",
      function() vim.lsp.buf.signature_help() end,
      { desc = "Signature help", noremap = true, silent = true }
    )
  end

  if client.supports_method "textDocument/typeDefinition" then
    vim.keymap.set(
      "n",
      "gy",
      function() require("telescope.builtin").lsp_type_definitions() end,
      { desc = "LSP type definition", noremap = true, silent = true }
    )
  end

  if client.supports_method "workspace/symbol" then
    vim.keymap.set("n", "<leader>ls", function()
      vim.ui.input({ prompt = "Symbol Query: (leave empty for word under cursor)" }, function(query)
        if query then
          -- word under cursor if given query is empty
          if query == "" then query = vim.fn.expand "<cword>" end
          require("telescope.builtin").lsp_workspace_symbols {
            query = query,
            prompt_title = ("Find word (%s)"):format(query),
          }
        end
      end)
    end, { desc = "Search workspace symbols", noremap = true, silent = true })
  end

  if client.supports_method "textDocument/documentHighlight" then
    M.add_buffer_autocmd("lsp_document_highlight", bufnr, {
      {
        events = { "CursorHold", "CursorHoldI" },
        desc = "highlight references when cursor holds",
        callback = function()
          if not M.has_capability("textDocument/documentHighlight", { bufnr = bufnr }) then
            M.del_buffer_autocmd("lsp_document_highlight", bufnr)
            return
          end
          vim.lsp.buf.document_highlight()
        end,
      },
      {
        events = { "CursorMoved", "CursorMovedI", "BufLeave" },
        desc = "clear references when cursor moves",
        callback = function() vim.lsp.buf.clear_references() end,
      },
    })
  end

  -- enable inlay hints
  if client.supports_method "textDocument/inlayHint" then
    vim.g.inlay_hints_visible = true
    vim.lsp.inlay_hint.enable(bufnr, true)
  else
    print(client.name .. " does not support inlay hints")
  end

  if client.name == "clangd" then M.load_mappings "cpp" end
end

-- Transparent background for lualine
function M.theme()
  local colors = {
    darkgray = "#16161d",
    gray = "#727169",
    innerbg = nil,
    outerbg = "#16161D",
    normal = "#7e9cd8",
    insert = "#98bb6c",
    visual = "#ffa066",
    replace = "#e46876",
    command = "#e6c384",
  }
  return {
    inactive = {
      a = { fg = colors.gray, bg = colors.outerbg, gui = "bold" },
      b = { fg = colors.gray, bg = colors.outerbg },
      c = { fg = colors.gray, bg = colors.innerbg },
    },
    visual = {
      a = { fg = colors.darkgray, bg = colors.visual, gui = "bold" },
      b = { fg = colors.gray, bg = colors.outerbg },
      c = { fg = colors.gray, bg = colors.innerbg },
    },
    replace = {
      a = { fg = colors.darkgray, bg = colors.replace, gui = "bold" },
      b = { fg = colors.gray, bg = colors.outerbg },
      c = { fg = colors.gray, bg = colors.innerbg },
    },
    normal = {
      a = { fg = colors.darkgray, bg = colors.normal, gui = "bold" },
      b = { fg = colors.gray, bg = colors.outerbg },
      c = { fg = colors.gray, bg = colors.innerbg },
    },
    insert = {
      a = { fg = colors.darkgray, bg = colors.insert, gui = "bold" },
      b = { fg = colors.gray, bg = colors.outerbg },
      c = { fg = colors.gray, bg = colors.innerbg },
    },
    command = {
      a = { fg = colors.darkgray, bg = colors.command, gui = "bold" },
      b = { fg = colors.gray, bg = colors.outerbg },
      c = { fg = colors.gray, bg = colors.innerbg },
    },
  }
end

return M
