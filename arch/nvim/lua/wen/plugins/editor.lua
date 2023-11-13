local path = "wen.plugins.config"

return {
    {
        "numToStr/Comment.nvim",
        keys = require(path .. ".comment").keys,
        opts = require(path .. ".comment").opts,
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
}
