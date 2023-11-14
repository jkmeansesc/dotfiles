local path = "wen.plugins.config"

return {
    {
        "numToStr/Comment.nvim",
        dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
        event = { "BufReadPre", "BufNewFile" },
        config = function() require(path .. ".comment") end,
    },

    {
        "stevearc/dressing.nvim",
        config = function() require(path .. ".dressing") end,
    },

    {
        "echasnovski/mini.bufremove",
        config = function() require(path .. ".mini-bufremove") end,
    },

    {
        "mrjones2014/smart-splits.nvim",
        config = function() require(path .. ".smart-splits") end,
    },

    {
        "inkarkat/vim-ReplaceWithRegister", -- replace with register contents using motion (gr + motion)
        event = "InsertEnter",
    },
}
