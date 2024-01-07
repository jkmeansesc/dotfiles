local M = {
  "rose-pine/neovim",
  enabled = false,
  name = "rose-pine",
  lazy = false,
  priority = 1000,
}
function M.config() vim.cmd [[colorscheme rose-pine]] end
return M
