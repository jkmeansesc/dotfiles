-- vim.cmd [[colorscheme cyberdream]]
local M = {
  "scottmckendry/cyberdream.nvim",
  enabled = false,
  lazy = false,
  priority = 1000,
}

function M.config()
  require("cyberdream").setup {
    transparent = false,
    italic_comments = true,
    hide_fillchars = true,
    borderless_telescope = true,
    terminal_colors = true,
  }
end

return M
