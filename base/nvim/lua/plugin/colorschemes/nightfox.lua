local M = {
  "EdenEast/nightfox.nvim",
  enabled = false,
  lazy = false,
  priority = 1000,
}
function M.config() vim.cmd [[colorscheme nightfox]] end
return M
