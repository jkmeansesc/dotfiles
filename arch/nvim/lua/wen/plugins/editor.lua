local path = "wen.plugins.config"

return {
    {
        "numToStr/Comment.nvim",
        -- keys = {
        --     { "gc", mode = { "n", "v" }, desc = "Comment toggle linewise" },
        --     { "gb", mode = { "n", "v" }, desc = "Comment toggle blockwise" },
        -- },
        opts = require(path .. ".comment").opts,
    },

    {
        "stevearc/dressing.nvim",
        init = require(path .. ".dressing").init,
    },

    {
        "echasnovski/mini.bufremove",
        config = require(path .. ".mini-bufremove").config,
    },

    {
        "mrjones2014/smart-splits.nvim",
        opts = require(path .. ".smart-splits").opts,
        config = require(path .. ".smart-splits").config,
    },
}
