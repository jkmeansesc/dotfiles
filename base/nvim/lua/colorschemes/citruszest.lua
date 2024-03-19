-- vim.cmd [[colorscheme citruszest]]
local M = {
  "zootedb0t/citruszest.nvim",
  enabled = false,
  lazy = false,
  priority = 1000,
}
function M.config()
  require("citruszest").setup {
    option = {
      transparent = false,
      bold = false,
      italic = true,
    },
  }
end
return M
