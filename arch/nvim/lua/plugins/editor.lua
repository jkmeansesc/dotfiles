local path = "wen.plugins.config"

return {
    {
        "numToStr/Comment.nvim",
        -- keys = require(path .. ".comment").keys,
        opts = require(path .. ".comment").opts,
        config = require(path .. ".comment").config,
    },

    {
        "stevearc/dressing.nvim",
        init = require(path .. ".dressing").init,
    },

    {
        "echasnovski/mini.bufremove",
        lazy = false,
        config = require(path .. ".mini-bufremove").config,
    },

    {
        "mrjones2014/smart-splits.nvim",
        lazy = false,
        opts = require(path .. ".smart-splits").opts,
        config = require(path .. ".smart-splits").config,
    },

    {
        "inkarkat/vim-ReplaceWithRegister", -- replace with register contents using motion (gr + motion)
        event = "InsertEnter",
    },
}
