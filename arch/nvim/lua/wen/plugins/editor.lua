local path = "wen.plugins.config"

return {
    {
        "numToStr/Comment.nvim",
        dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
        event = { "BufReadPre", "BufNewFile" },
        config = require(path .. ".comment"),
    },

    {
        "stevearc/dressing.nvim",
        config = require(path .. ".dressing"),
    },

    {
        "echasnovski/mini.bufremove",
        config = require(path .. ".mini-bufremove"),
    },

    {
        "mrjones2014/smart-splits.nvim",
        config = require(path .. ".smart-splits"),
    },

    -- {
    --     "inkarkat/vim-ReplaceWithRegister", -- replace with register contents using motion (gr + motion)
    --     event = "InsertEnter",
    -- },
}
