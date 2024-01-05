local M = {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "barreiroleo/ltex-extra.nvim",
    "smjonas/inc-rename.nvim", -- LSP renaming with immediate visual feedback
    "folke/neodev.nvim",
  },
}

local function add_buffer_autocmd(augroup, bufnr, autocmds)
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

local function del_buffer_autocmd(augroup, bufnr)
  local cmds_found, cmds = pcall(vim.api.nvim_get_autocmds, { group = augroup, buffer = bufnr })
  if cmds_found then vim.tbl_map(function(cmd) vim.api.nvim_del_autocmd(cmd.id) end, cmds) end
end

local function on_attach(client, bufnr)
  client.server_capabilities.documentFormattingProvider = false
  client.server_capabilities.documentRangeFormattingProvider = false

  local utils = require "core.utils"

  -- load unconditional lsp keymaps
  utils.load_mappings "lspconfig"

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
    add_buffer_autocmd("lsp_codelens_refresh", bufnr, {
      events = { "InsertLeave", "BufEnter" },
      desc = "Refresh codelens",
      callback = function()
        if not utils.has_capability("textDocument/codeLens", { bufnr = bufnr }) then
          del_buffer_autocmd("lsp_codelens_refresh", bufnr)
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
    add_buffer_autocmd("lsp_document_highlight", bufnr, {
      {
        events = { "CursorHold", "CursorHoldI" },
        desc = "highlight references when cursor holds",
        callback = function()
          if not utils.has_capability("textDocument/documentHighlight", { bufnr = bufnr }) then
            del_buffer_autocmd("lsp_document_highlight", bufnr)
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

  if client.name == "clangd" then utils.load_mappings "cpp" end
  if client.name == "ltex" then
    require("ltex_extra").setup {
      path = vim.api.nvim_call_function("stdpath", { "cache" }) .. "/ltex/",
    }
  end
end

function M.config()
  local lspconfig = require "lspconfig"
  local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
  local icons = require("core.icons").diagnostic
  local signs = {
    { name = "DiagnosticSignError", text = icons.DiagnosticError, texthl = "DiagnosticSignError" },
    { name = "DiagnosticSignWarn", text = icons.DiagnosticWarn, texthl = "DiagnosticSignWarn" },
    { name = "DiagnosticSignHint", text = icons.DiagnosticHint, texthl = "DiagnosticSignHint" },
    { name = "DiagnosticSignInfo", text = icons.DiagnosticInfo, texthl = "DiagnosticSignInfo" },
    { name = "DapStopped", text = icons.DapStopped, texthl = "DiagnosticWarn" },
    { name = "DapBreakpoint", text = icons.DapBreakpoint, texthl = "DiagnosticInfo" },
    { name = "DapBreakpointRejected", text = icons.DapBreakpointRejected, texthl = "DiagnosticError" },
    { name = "DapBreakpointCondition", text = icons.DapBreakpointCondition, texthl = "DiagnosticInfo" },
    { name = "DapLogPoint", text = icons.DapLogPoint, texthl = "DiagnosticInfo" },
  }
  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, sign)
  end

  vim.diagnostic.config {
    signs = {
      active = signs,
    },
    virtual_text = false,
    update_in_insert = false, -- reduce excessive notifications
    underline = true,
    severity_sort = true,
    float = {
      focusable = true,
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
    },
  }

  local servers = {
    "lua_ls",
    "yamlls",
    "html",
    "cssls",
    "emmet_ls",
    "pyright",
    "pyright",
    "jsonls",
    "ansiblels",
    "docker_compose_language_service",
    "dockerls",
    "lemminx",
    "marksman",
    "clangd",
    "ltex",
  }

  for _, server in ipairs(servers) do
    local opts = {
      on_attach = on_attach,
      capabilities = capabilities,
    }
    local require_ok, settings = pcall(require, "user.lspsettings." .. server)
    if require_ok then opts = vim.tbl_deep_extend("force", settings, opts) end
    if server == "lua_ls" then
      require("neodev").setup {
        library = { plugins = { "nvim-dap-ui" }, types = true },
      }
    end
    if server == "clangd" then opts.capabilities = {
      offsetEncoding = { "utf-16" },
    } end
    lspconfig[server].setup { opts }
  end
end

return M
