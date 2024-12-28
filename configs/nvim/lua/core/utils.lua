local M = {}

--- Simplify the mapping of keys.
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

function M.on_attach(client)
  local map = M.map
  map("n", "gh", vim.diagnostic.open_float, { desc = "[G]oto [H]over Diagnostic" })
  map({ "n", "v" }, "<Leader>la", vim.lsp.buf.code_action, { desc = "Code [A]ction" })
  map("n", "gd", "<CMD>Telescope lsp_definitions<CR>", { desc = "[G]oto [D]efinition" })
  map("n", "gD", vim.lsp.buf.declaration, { desc = "[G]oto [D]eclaration" })
  map("n", "gi", "<CMD>Telescope lsp_implementations<CR>", { desc = "[G]oto [I]mplementation" })
  map("n", "gr", "<CMD>Telescope lsp_references<CR>", { desc = "[G]oto [R]eferences" })
  map("n", "<Leader>lh", vim.lsp.buf.signature_help, { desc = "Signature [H]elp" })
  map("n", "gy", "<CMD>Telescope lsp_type_definitions<CR>", { desc = "T[y]pe Definition" })
  map("n", "<leader>ls", "<CMD>Telescope lsp_document_symbols<CR>", { desc = "Document [S]ymbols" })
  map("n", "<leader>lS", "<CMD>Telescope lsp_workspace_symbols<CR>", { desc = "Workspace [S]ymbols" })
  map("n", "<leader>ld", "<CMD>Telescope diagnostics<CR>", { desc = "[D]iagnostics " })
  if client.supports_method "textDocument/codeLens" then
    map("n", "<Leader>ll", vim.lsp.codelens.refresh, { desc = "Code[L]ens refresh" })
    map("n", "<Leader>lL", vim.lsp.codelens.run, { desc = "Code[L]ens run" })
  end
  if client.supports_method "textDocument/rename" then
    map("n", "<Leader>lr", vim.lsp.buf.rename, { desc = "[R]ename" })
  end
  -- enable inlay hints
  if client.supports_method "textDocument/inlayHint" then
    vim.g.inlay_hints_visible = true
    vim.lsp.inlay_hint.enable(true)
    vim.notify(client.name .. " supports inlay hints", vim.log.levels.INFO)
  end
end

return M
