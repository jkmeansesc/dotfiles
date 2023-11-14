local path = "wen.plugins.config"

return {
    {
        "akinsho/bufferline.nvim",
        event = "VeryLazy",
        config = function() require(path .. ".bufferline") end,
    },

    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        event = "VeryLazy",
        config = function() require(path .. ".lualine") end,
    },

    {
        "goolord/alpha-nvim",
        event = "VimEnter",
        -- enabled = true,
        -- init = false,
        config = function() require(path .. ".alpha-nvim") end,
    },
}
