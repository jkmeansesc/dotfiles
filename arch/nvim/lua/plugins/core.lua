local path = "plugins.config"

return {
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = require(path .. ".which-key").init,
        opts = require(path .. ".which-key").opts,
        config = require(path .. ".which-key").config,
    },

    {
        "nvim-tree/nvim-tree.lua",
        lazy = false,
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = require(path .. ".nvim-tree").opts,
        config = require(path .. ".nvim-tree").config,
    },

    {
        "nvim-treesitter/nvim-treesitter",
        version = false,
        build = ":TSUpdate",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "nvim-treesitter/nvim-treesitter-textobjects",
            "JoosepAlviste/nvim-ts-context-commentstring",
        },
        cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
        keys = require(path .. ".nvim-treesitter").keys,
        init = require(path .. ".nvim-treesitter").init,
        opts = require(path .. ".nvim-treesitter").opts,
        config = require(path .. ".nvim-treesitter").config,
    },

    {
        "lewis6991/gitsigns.nvim",
        enabled = vim.fn.executable "git" == 1,
        ft = { "gitcommit", "diff" },
        init = require(path .. ".gitsigns").init,
        opts = require(path .. ".gitsigns").opts,
        config = require(path .. ".gitsigns").config,
    },

    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "nvim-treesitter/nvim-treesitter",
            { "nvim-telescope/telescope-fzf-native.nvim", enabled = vim.fn.executable "make" == 1, build = "make" },
        },
        cmd = "Telescope",
        opts = require(path .. ".telescope").opts,
        config = require(path .. ".telescope").config,
    },
}
