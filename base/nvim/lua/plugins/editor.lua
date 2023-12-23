return {
  { "echasnovski/mini.bufremove", init = function() require("core.utils").load_mappings "minibufremove" end },
  { "max397574/better-escape.nvim", event = "VimEnter", opts = { timeout = 300 } },
  { "karb94/neoscroll.nvim", event = "VeryLazy", config = true },
  { "NvChad/nvim-colorizer.lua", event = { "BufReadPre", "BufNewFile" }, config = true },
  { "b0o/schemastore.nvim", enabled = false }, -- TODO: try this out when setting up projects
  { "kylechui/nvim-surround", event = "VeryLazy", config = true },
  { "keaising/im-select.nvim", enabled = false, lazy = false, config = true },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = { "BufReadPre", "BufNewFile" },
    config = true,
  },
  {
    "numToStr/Comment.nvim",
    dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
    keys = {
      { "gcc", mode = "n", desc = "Comment toggle current line" },
      { "gc", mode = { "n", "o" }, desc = "Comment toggle linewise" },
      { "gc", mode = "x", desc = "Comment toggle linewise (visual)" },
      { "gbc", mode = "n", desc = "Comment toggle current block" },
      { "gb", mode = { "n", "o" }, desc = "Comment toggle blockwise" },
      { "gb", mode = "x", desc = "Comment toggle blockwise (visual)" },
    },
    init = function() require("core.utils").load_mappings "comment" end,
    config = require "configs.comment",
  },
  {
    "smjonas/inc-rename.nvim", -- LSP renaming with immediate visual feedback
    init = function() require("core.utils").load_mappings "increname" end,
    config = true,
  },
  {
    "NMAC427/guess-indent.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = require "configs.guess-indent",
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    version = "2.20.7",
    event = { "BufReadPre", "BufNewFile" },
    init = function() require("core.utils").load_mappings "blankline" end,
    opts = require "configs.indent-blankline",
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      {
        "rcarriga/nvim-notify",
        opts = { background_colour = "#000000" },
      },
    },
    opts = require "configs.noice",
  },
  {
    "mrjones2014/smart-splits.nvim",
    init = function() require("core.utils").load_mappings "smartsplits" end,
    opts = require "configs.smart-splits",
  },
  {
    "RRethy/vim-illuminate",
    event = { "BufReadPre", "BufNewFile" },
    config = require "configs.vim-illuminate",
  },
}
