return {
  {
    "lewis6991/gitsigns.nvim",
    ft = { "gitcommit", "diff" },
    init = function()
      -- load gitsigns only when a git file is opened
      vim.api.nvim_create_autocmd({ "BufRead" }, {
        group = vim.api.nvim_create_augroup("GitSignsLazyLoad", { clear = true }),
        callback = function()
          vim.fn.system("git -C " .. '"' .. vim.fn.expand "%:p:h" .. '"' .. " rev-parse")
          if vim.v.shell_error == 0 then
            vim.api.nvim_del_augroup_by_name "GitSignsLazyLoad"
            vim.schedule(function() require("lazy").load { plugins = { "gitsigns.nvim" } } end)
          end
        end,
      })
      require("core.utils").load_mappings "gitsigns"
    end,
    opts = require "configs.gitsigns",
  },
  {
    "williamboman/mason.nvim",
    cmd = {
      "Mason",
      "MasonInstall",
      "MasonUninstall",
      "MasonUninstallAll",
      "MasonLog",
      "MasonUpdate",
      "MasonUpdateAll",
    },
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "jay-babu/mason-null-ls.nvim",
      { "jay-babu/mason-nvim-dap.nvim", dependencies = { "nvim-dap" } },
    },
    config = require "configs.mason",
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    enabled = false,
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
    cmd = "Neotree",
    init = function() require("core.utils").load_mappings "neotree" end,
    opts = require "configs.neo-tree",
  },
  {
    "nvim-tree/nvim-tree.lua",
    -- enabled = false,
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    dependencies = { "nvim-tree/nvim-web-devicons" },
    init = function() require("core.utils").load_mappings "nvimtree" end,
    config = require "configs.nvim-tree",
  },
  {
    "nvimtools/none-ls.nvim",
    lazy = true,
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "jay-babu/mason-null-ls.nvim" },
    config = require "configs.none-ls",
  },
  {
    "hrsh7th/nvim-cmp",
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = {
      "saadparwaiz1/cmp_luasnip", -- for autocompletion
      "hrsh7th/cmp-buffer", -- source for text in buffer
      "hrsh7th/cmp-path", -- source for file system paths
      "onsails/lspkind.nvim", -- vs-code like pictograms
      "hrsh7th/cmp-nvim-lsp",
      {
        "zbirenbaum/copilot.lua",
        event = "InsertEnter",
        cmd = "Copilot",
        build = ":Copilot auth",
        opts = require "configs.copilot",
      },
      { "zbirenbaum/copilot-cmp", config = true },
      {
        "L3MON4D3/LuaSnip",
        dependencies = "rafamadriz/friendly-snippets", -- useful snippets
        config = require "configs.luasnip",
      }, -- snippet engine
      { "windwp/nvim-autopairs", config = require "configs.nvim-autopairs" },
    },
    config = require "configs.nvim-cmp",
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
    },
    opts = require "configs.nvim-treesitter",
    config = function(_, opts) require("nvim-treesitter.configs").setup(opts) end,
  },
  {
    "nvim-telescope/telescope.nvim",
    -- branch = "0.1.x",
    version = false,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "debugloop/telescope-undo.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", enabled = vim.fn.executable "make" == 1, build = "make" },
    },
    cmd = "Telescope",
    init = function() require("core.utils").load_mappings "telescope" end,
    config = require "configs.telescope",
  },
  {
    "akinsho/toggleterm.nvim",
    cmd = { "ToggleTerm", "TermExec" },
    init = function() require("core.utils").load_mappings "toggleterm" end,
    opts = require "configs.toggleterm",
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = require "configs.which-key",
  },
}
