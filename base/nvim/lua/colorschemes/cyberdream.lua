-- vim.cmd [[colorscheme cyberdream]]
return {
  "scottmckendry/cyberdream.nvim",
  enabled = false,
  lazy = false,
  priority = 1000,
  config = function()
    require("cyberdream").setup {
      transparent = false,
      italic_comments = true,
      hide_fillchars = true,
      borderless_telescope = true,
      terminal_colors = true,
    }
  end,
}
