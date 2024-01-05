return {
  {
    "goolord/alpha-nvim",
    event = "VimEnter",
    config = require "configs.alpha-nvim",
  },
  {
    "akinsho/bufferline.nvim",
    enabled = false,
    event = "VeryLazy",
    init = function() require("core.utils").load_mappings "bufferline" end,
    opts = require "configs.bufferline",
  },
  {
    "SmiteshP/nvim-navic",
    commit = "0ffa7ffe6588f3417e680439872f5049e38a24db",
    config = require "configs.nvim-navic",
  },
  {
    "LunarVim/breadcrumbs.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      { "SmiteshP/nvim-navic" },
    },
    config = function() require("breadcrumbs").setup() end,
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "AndreM222/copilot-lualine",
    },
    event = "VeryLazy",
    config = require "configs.lualine",
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    version = "2.20.7",
    event = { "BufReadPre", "BufNewFile" },
    init = function() require("core.utils").load_mappings "blankline" end,
    opts = require "configs.indent-blankline",
  },
  { "NvChad/nvim-colorizer.lua", event = { "BufReadPre", "BufNewFile" }, config = true },
  {
    "RRethy/vim-illuminate",
    event = { "BufReadPre", "BufNewFile" },
    config = require "configs.vim-illuminate",
  },
}
