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
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",
    config = require "configs.lualine",
  },
}
