local M = {
  "kepano/flexoki-neovim",
  enabled = false,
  lazy = false,
  priority = 1000,
  name = "flexoki",
}
function M.config() vim.cmd [[colorscheme flexoki-dark]] end
return M
