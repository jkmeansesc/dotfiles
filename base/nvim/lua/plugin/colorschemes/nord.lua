local M = {
  "shaunsingh/nord.nvim",
  enabled = false,
  lazy = false,
  priority = 1000,
}
function M.config() vim.cmd [[colorscheme nord]] end
return M
