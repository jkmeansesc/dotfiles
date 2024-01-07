local M = {
  "sainnhe/edge",
  enabled = false,
  lazy = false,
  priority = 1000,
}

function M.config() vim.cmd [[colorscheme edge]] end

return M
