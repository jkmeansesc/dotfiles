local M = {
  "sainnhe/gruvbox-material",
  enabled = false,
  lazy = false,
  priority = 1000,
}
function M.config() vim.cmd [[colorscheme gruvbox-material]] end
return M
