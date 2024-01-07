local M = {
  "bluz71/vim-nightfly-colors",
  enabled = false,
  name = "nightfly",
  lazy = false,
  priority = 1000,
}
function M.config() vim.cmd [[colorscheme nightfly]] end
return M
