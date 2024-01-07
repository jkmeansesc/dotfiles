local M = {
  "savq/melange-nvim",
  enabled = false,
  lazy = false,
  priority = 1000,
}
function M.config() vim.cmd [[colorscheme melange]] end
return M
