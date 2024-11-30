local M = {}

--- Simplify the mapping of keys.
--- @param mode string|table The mode(s) under which the key mapping will be active. A single mode as a
--- string or a table of modes.
--- @param lhs string The left-hand side of the map, i.e., the key combination that triggers the action.
--- @param rhs string|function The right-hand side of the map, i.e., the command or Lua function to execute when the
--- key combination is pressed.
--- @param opts table? An optional table of options that will override the default mapping options. These options are
--- passed directly to `vim.keymap.set`.
function M.map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  mode = mode or "n"
  if opts then options = vim.tbl_extend("force", options, opts) end
  vim.keymap.set(mode, lhs, rhs, options)
end

--- Check if a lua plugin can be required without causing an error.
--- @param name string The plugin name to check for availability.
--- @return boolean `true` if the module can be loaded, `false` otherwise.
function M.is_available(name)
  local ok, _ = pcall(require, name)
  return ok
end

--- Sets highlight groups based on a provided table.
--- @param highlightGroups table: A table with highlight group names as keys and tables of style attributes as values.
function M.setHighlightGroups(highlightGroups)
  for groupName, styles in pairs(highlightGroups) do
    vim.api.nvim_set_hl(0, groupName, styles)
  end
end

--- Function to set highlights for a given plugin.
--- @param pluginName string: The name of the plugin. Note: the name is arbitrary and needs to exist in "core.highlights".
function M.setPluginHighlights(pluginName)
  local hl = require("core.highlights")[pluginName]
  if hl then
    M.setHighlightGroups(hl)
  else
    M.notify("No highlight definitions found for plugin: " .. pluginName, "WARN")
  end
end

--- Sends a notification message with a specified log level.
--- This function abstracts over Neovim's vim.notify and the fidget plugin's notify function,
--- automatically choosing the available method. It allows specifying the log level as a simple string.
--- @param message string: The notification message to be displayed.
--- @param level string: A string representing the log level (e.g., "WARN", "INFO", "ERROR"). Defaults to "WARN" if an unrecognized string is provided.
function M.notify(message, level)
  local log_levels = {
    TRACE = vim.log.levels.TRACE,
    DEBUG = vim.log.levels.DEBUG,
    INFO = vim.log.levels.INFO,
    WARN = vim.log.levels.WARN,
    ERROR = vim.log.levels.ERROR,
  }
  local log_level = log_levels[level] or vim.log.levels.WARN
  if M.is_available "fidget" then
    require("fidget").notify(message, log_level)
  else
    vim.notify(message, log_level)
  end
end

--- Generates a rounded border.
--- @param hl_name string: The name of the highlight group to be applied to the border.
--- @return table: A table where each element represents a part of the border with its character and highlight.
function M.rounded_border(hl_name)
  return {
    { "╭", hl_name },
    { "─", hl_name },
    { "╮", hl_name },
    { "│", hl_name },
    { "╯", hl_name },
    { "─", hl_name },
    { "╰", hl_name },
    { "│", hl_name },
  }
end

--- Generates a box border style.
--- @param hl_name string: The name of the highlight group to be applied to the border.
--- @return table: A table where each element represents a part of the border with its character and highlight.
function M.box_boarder(hl_name)
  return {
    { "╔", hl_name },
    { "═", hl_name },
    { "╗", hl_name },
    { "║", hl_name },
    { "╝", hl_name },
    { "═", hl_name },
    { "╚", hl_name },
    { "║", hl_name },
  }
end

--- Generates a straight border style.
--- @param hl_name string: The name of the highlight group to be applied to the border.
--- @return table: A table where each element represents a part of the border with its character and highlight.
function M.straight_boarder(hl_name)
  return {
    { "┌", hl_name }, -- Top-left corner
    { "─", hl_name }, -- Top and bottom sides
    { "┐", hl_name }, -- Top-right corner
    { "│", hl_name }, -- Left and right sides
    { "┘", hl_name }, -- Bottom-right corner
    { "─", hl_name }, -- Top and bottom sides (repeated for clarity)
    { "└", hl_name }, -- Bottom-left corner
    { "│", hl_name }, -- Left and right sides (repeated for clarity)
  }
end

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

function M.on_attach(client)
  local map = require("core.utils").map

  -- lsp globals
  map("n", "gh", function() vim.diagnostic.open_float() end, { desc = "Floating diagnostic" })

  if client.supports_method "textDocument/codeAction" then
    map({ "n", "v" }, "<Leader>la", function() vim.lsp.buf.code_action() end, { desc = "LSP code action" })
  end

  if client.supports_method "textDocument/codeLens" then
    map("n", "<Leader>ll", function() vim.lsp.codelens.refresh() end, { desc = "LSP CodeLens refresh" })
    map("n", "<Leader>lL", function() vim.lsp.codelens.run() end, { desc = "LSP CodeLens run" })
  end

  if client.supports_method "textDocument/declaration" then
    map("n", "gD", function() vim.lsp.buf.declaration() end, { desc = "LSP declaration" })
  end

  if client.supports_method "textDocument/definition" then
    map("n", "gd", function() require("telescope.builtin").lsp_definitions() end, { desc = "LSP definition" })
  end

  if client.supports_method "textDocument/implementation" then
    map("n", "gi", function() require("telescope.builtin").lsp_implementations() end, { desc = "LSP implementation" })
  end

  if client.supports_method "textDocument/references" then
    map("n", "gr", function() require("telescope.builtin").lsp_references() end, { desc = "LSP references" })
  end

  if client.supports_method "textDocument/rename" then
    require("inc_rename").setup()
    map("n", "<Leader>lr", function() return ":IncRename " .. vim.fn.expand "<cword>" end, { desc = "LSP rename" })
  end

  if client.supports_method "textDocument/signatureHelp" then
    map("n", "<Leader>lh", function() vim.lsp.buf.signature_help() end, { desc = "Signature help" })
  end

  if client.supports_method "textDocument/typeDefinition" then
    map("n", "gy", function() require("telescope.builtin").lsp_type_definitions() end, { desc = "LSP type definition" })
  end

  if client.supports_method "workspace/symbol" then
    map("n", "<Leader>ls", function()
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
    end, { desc = "Search workspace symbols" })
  end

  -- enable inlay hints
  if client.supports_method "textDocument/inlayHint" then
    vim.g.inlay_hints_visible = true
    vim.lsp.inlay_hint.enable(true)
    M.notify(client.name .. " supports inlay hints", "INFO")
  end
end

return M
