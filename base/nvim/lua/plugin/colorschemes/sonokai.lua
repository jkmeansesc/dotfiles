local M = {
  "sainnhe/sonokai",
  enabled = false,
  lazy = false,
  priority = 1000,
}
function M.config() vim.cmd [[colorscheme sonokai]] end
return M
