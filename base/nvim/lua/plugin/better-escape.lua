return {
  "max397574/better-escape.nvim",
  event = "VimEnter",
  config = function()
    require("better_escape").setup {
      mapping = { "jk", "jj" },
      timeout = 250,
    }
  end,
}
