local path = "wen.plugins.config"

return {
    {
        "akinsho/bufferline.nvim",
        event = "VeryLazy",
        keys = require(path .. ".bufferline").keys,
        opts = require(path .. ".bufferline").opts,
        config = require(path .. ".bufferline").config,
    },

    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        event = "VeryLazy",
        init = require(path .. ".lualine").init,
        opts = require(path .. ".lualine").opts,
        config = require(path .. ".lualine").config,
    },

    {
        "goolord/alpha-nvim",
        event = "VimEnter",
        enabled = true,
        init = false,
        opts = require(path .. ".alpha-nvim").opts,
        config = require(path .. ".alpha-nvim").config,
    },
}
