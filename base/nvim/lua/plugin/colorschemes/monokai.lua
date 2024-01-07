local M = {
  "tanvirtin/monokai.nvim",
  enabled = false,
  lazy = false,
  priority = 1000,
}
function M.config() vim.cmd [[colorscheme monokai]] end
return M
