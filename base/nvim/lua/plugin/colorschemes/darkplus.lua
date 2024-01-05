local M = {
  "lunarvim/darkplus.nvim",
  lazy = false,
  priority = 1000,
}

function M.config() vim.cmd [[colorscheme darkplus]] end

return M
