local M = {}

M.opts = {
    ignored_filetypes = { "nofile", "quickfix", "qf", "prompt" },
    ignored_buftypes = { "nofile" },
}

M.config = function()
    local ss = require "smart-splits"

    require("which-key").register {
        ["<A-h>"] = { ss.resize_left, "Resize left" },
        ["<A-j>"] = { ss.resize_down, "Resize down" },
        ["<A-k>"] = { ss.resize_up, "Resize up" },
        ["<A-l>"] = { ss.resize_right, "Resize right" },

        ["<C-h>"] = { ss.move_cursor_left, "Move cursor left" },
        ["<C-j>"] = { ss.move_cursor_down, "Move cursor down" },
        ["<C-k>"] = { ss.move_cursor_up, "Move cursor up" },
        ["<C-l>"] = { ss.move_cursor_right, "Move cursor right" },

        ["<leader>sh"] = { ss.swap_buf_left, "Swap left" },
        ["<leader>sj"] = { ss.swap_buf_down, "Swap down" },
        ["<leader>sk"] = { ss.swap_buf_up, "Swap up" },
        ["<leader>sl"] = { ss.swap_buf_right, "Swap right" },
    }
end

return M
