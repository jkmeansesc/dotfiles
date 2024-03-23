-- vim.cmd [[colorscheme oxocarbon]]
return {
  "nyoom-engineering/oxocarbon.nvim",
  enabled = false,
  lazy = false,
  priority = 1000,
  config = function()
    vim.opt.background = "dark"
    require("oxocarbon").setup()
  end,
}
