return function()
    local splits = require "smart-splits"
    local keymap = vim.keymap

    splits.setup {
        ignored_filetypes = { "nofile", "quickfix", "qf", "prompt" },
        ignored_buftypes = { "nofile" },
    }

    keymap.set("n", "<A-h>", splits.resize_left, { desc = "Resize left" })
    keymap.set("n", "<A-j>", splits.resize_down, { desc = "Resize down" })
    keymap.set("n", "<A-k>", splits.resize_up, { desc = "Resize up" })
    keymap.set("n", "<A-l>", splits.resize_right, { desc = "Resize right" })

    keymap.set("n", "<C-h>", splits.move_cursor_left, { desc = "Move cursor left" })
    keymap.set("n", "<C-j>", splits.move_cursor_down, { desc = "Move cursor down" })
    keymap.set("n", "<C-k>", splits.move_cursor_up, { desc = "Move cursor up" })
    keymap.set("n", "<C-l>", splits.move_cursor_right, { desc = "Move cursor right" })

    keymap.set("n", "<leader>sh", splits.swap_buf_left, { desc = "Swap left" })
    keymap.set("n", "<leader>sj", splits.swap_buf_down, { desc = "Swap down" })
    keymap.set("n", "<leader>sk", splits.swap_buf_up, { desc = "Swap up" })
    keymap.set("n", "<leader>sl", splits.swap_buf_right, { desc = "Swap right" })
end
