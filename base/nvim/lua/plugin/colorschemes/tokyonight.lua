local M = {
  "folke/tokyonight.nvim",
  enabled = false,
  lazy = false,
  priority = 1000,
}
function M.config() vim.cmd [[colorscheme tokyonight]] end
return M
