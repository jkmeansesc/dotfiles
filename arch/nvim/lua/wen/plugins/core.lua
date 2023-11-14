local path = "wen.plugins.config"

return {
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        config = require(path .. ".which-key"),
    },

    {
        "nvim-tree/nvim-tree.lua",
        lazy = false,
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = require(path .. ".nvim-tree"),
    },

    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        event = { "BufReadPre", "BufNewFile" },
        init = function(plugin)
            -- PERF: add nvim-treesitter queries to the rtp and it's custom query predicates early
            -- This is needed because a bunch of plugins no longer `require("nvim-treesitter")`, which
            -- no longer trigger the **nvim-treeitter** module to be loaded in time.
            -- Luckily, the only thins that those plugins need are the custom queries, which we make available
            -- during startup.
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

    -- {
    --     "lewis6991/gitsigns.nvim",
    --     enabled = vim.fn.executable "git" == 1,
    --     ft = { "gitcommit", "diff" },
    --     config = require(path .. ".gitsigns"),
    -- },

    -- {
    --     "nvim-telescope/telescope.nvim",
    --     dependencies = {
    --         "nvim-lua/plenary.nvim",
    --         "nvim-tree/nvim-web-devicons",
    --         "nvim-treesitter/nvim-treesitter",
    --         { "nvim-telescope/telescope-fzf-native.nvim", enabled = vim.fn.executable "make" == 1, build = "make" },
    --     },
    --     cmd = "Telescope",
    --     config = require(path .. ".telescope"),
    -- },
}
