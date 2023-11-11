return {
    "echasnovski/mini.comment",
    event = "VeryLazy",
    keys = {
        { "gc", mode = { "n", "v" }, desc = "Comment toggle linewise" },
        { "gb", mode = { "n", "v" }, desc = "Comment toggle blockwise" },
    },

    opts = {
               options = {
                   custom_commentstring = function()
                       return require("ts_context_commentstring.internal").calculate_commentstring() or vim.bo.commentstring
                   end,
               },
    },
}
