local M = {
  "ellisonleao/gruvbox.nvim",
  enabled = false,
  lazy = false,
  priority = 1000,
}

M.opts = { transparent_mode = false }
function M.config() vim.cmd [[colorscheme gruvbox]] end
return M
