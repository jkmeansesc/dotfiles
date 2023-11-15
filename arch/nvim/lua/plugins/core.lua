local path = "plugins.config"

return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = require(path .. ".which-key"),
  },

  -- {
  --     "nvim-tree/nvim-tree.lua",
  --     lazy = false,
  --     dependencies = { "nvim-tree/nvim-web-devicons" },
  --     config = require(path .. ".nvim-tree"),
  -- },

  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
    cmd = "Neotree",
    config = require(path .. ".neo-tree"),
  },

  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPre", "BufNewFile" },
    init = function(plugin)
      require("lazy.core.loader").add_to_rtp(plugin)
      require "nvim-treesitter.query_predicates"
    end,
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
    cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
    config = require(path .. ".nvim-treesitter"),
  },

  {
    "lewis6991/gitsigns.nvim",
    enabled = vim.fn.executable "git" == 1,
    ft = { "gitcommit", "diff" },
    config = require(path .. ".gitsigns"),
  },

  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    event = "VimEnter",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "nvim-treesitter/nvim-treesitter",
      { "nvim-telescope/telescope-fzf-native.nvim", enabled = vim.fn.executable "make" == 1, build = "make" },
    },
    cmd = "Telescope",
    config = require(path .. ".telescope"),
  },

  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-buffer", -- source for text in buffer
      "hrsh7th/cmp-path", -- source for file system paths
      "L3MON4D3/LuaSnip", -- snippet engine
      "saadparwaiz1/cmp_luasnip", -- for autocompletion
      "rafamadriz/friendly-snippets", -- useful snippets
      "onsails/lspkind.nvim", -- vs-code like pictograms
    },
    config = require(path .. ".nvim-cmp"),
  },
}
