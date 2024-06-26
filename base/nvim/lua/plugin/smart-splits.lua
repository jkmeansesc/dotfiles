return {
    "mrjones2014/smart-splits.nvim",
    keys = {
        { "<A-h>", function() require("smart-splits").resize_left() end, desc = "Resize left" },
        { "<A-j>", function() require("smart-splits").resize_down() end, desc = "Resize down" },
        { "<A-k>", function() require("smart-splits").resize_up() end, desc = "Resize up" },
        { "<A-l>", function() require("smart-splits").resize_right() end, desc = "Resize right" },

        { "<C-h>", function() require("smart-splits").move_cursor_left() end, desc = "Move cursor left" },
        { "<C-j>", function() require("smart-splits").move_cursor_down() end, desc = "Move cursor down" },
        { "<C-k>", function() require("smart-splits").move_cursor_up() end, desc = "Move cursor up" },
        { "<C-l>", function() require("smart-splits").move_cursor_right() end, desc = "Move cursor right" },

        { "<Leader>bh", function() require("smart-splits").swap_buf_left() end, desc = "Swap left" },
        { "<Leader>bj", function() require("smart-splits").swap_buf_down() end, desc = "Swap down" },
        { "<Leader>bk", function() require("smart-splits").swap_buf_up() end, desc = "Swap up" },
        { "<Leader>bl", function() require("smart-splits").swap_buf_right() end, desc = "Swap right" },
    },
    config = function()
        require("smart-splits").setup {
            ignored_filetypes = { "nofile", "quickfix", "qf", "prompt" },
            ignored_buftypes = { "nofile" },
        }
    end,
}
