local M = {
  "NLKNguyen/papercolor-theme",
  enabled = false,
  lazy = false,
  priority = 1000,
}
function M.config() vim.cmd [[colorscheme PaperColor]] end
return M
