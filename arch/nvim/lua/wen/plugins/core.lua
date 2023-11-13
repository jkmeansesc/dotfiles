local path = "wen.plugins.config"

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
        keys = {
            { "<c-space>", desc = "Increment selection" },
            { "<bs>", desc = "Decrement selection", mode = "x" },
        },
        init = require(path .. ".nvim-treesitter").init,
        opts = require(path .. ".nvim-treesitter").opts,
        config = require(path .. ".nvim-treesitter").config,
    },
}
