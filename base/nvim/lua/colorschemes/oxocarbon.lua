-- vim.cmd [[colorscheme oxocarbon]]
local M = {
  "nyoom-engineering/oxocarbon.nvim",
  enabled = false,
  lazy = false,
  priority = 1000,
}

function M.config() vim.opt.background = "dark" end

return M
