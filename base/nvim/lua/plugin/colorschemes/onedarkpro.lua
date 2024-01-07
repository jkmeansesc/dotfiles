local M = {
  "olimorris/onedarkpro.nvim",
  enabled = false,
  lazy = false,
  priority = 1000,
}
function M.config() vim.cmd [[colorscheme onedarkpro]] end
return M
