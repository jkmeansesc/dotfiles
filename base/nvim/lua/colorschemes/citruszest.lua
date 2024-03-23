-- vim.cmd [[colorscheme citruszest]]
return {
  "zootedb0t/citruszest.nvim",
  enabled = false,
  lazy = false,
  priority = 1000,
  config = function()
    require("citruszest").setup {
      option = {
        transparent = false,
        bold = false,
        italic = true,
      },
    }
  end,
}
