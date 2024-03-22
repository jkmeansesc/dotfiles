-- vim.cmd [[colorscheme oxocarbon]]
return {
  "nyoom-engineering/oxocarbon.nvim",
  enabled = false,
  lazy = false,
  priority = 1000,
  opts = function()
    vim.opt.background = "dark"
    return {}
  end,
}
