return {
  {
    "goolord/alpha-nvim",
    event = "VimEnter",
    config = require "configs.alpha-nvim",
  },
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    init = function() require("core.utils").load_mappings "bufferline" end,
    opts = require "configs.bufferline",
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
