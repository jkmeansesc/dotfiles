return {
    "folke/which-key.nvim",
    config = function()
        local wk = require "which-key"
        wk.register {
            -- Standard Operations
            ["j"] = { "v:count == 0 ? 'gj' : 'j'", expr = true, desc = "Move cursor down" },
            ["k"] = { "v:count == 0 ? 'gk' : 'k'", expr = true, desc = "Move cursor up" },
            ["<leader>q"] = { "<cmd>confirm q<cr>", desc = "Quit" },
            ["<leader>n"] = { "<cmd>enew<cr>", desc = "New File" },
            ["<C-s>"] = { "<cmd>w!<cr>", desc = "Force write" },
            ["<C-q>"] = { "<cmd>qa!<cr>", desc = "Force quit" },
            ["|"] = { "<cmd>vsplit<cr>", desc = "Vertical Split" },
            ["\\"] = { "<cmd>split<cr>", desc = "Horizontal Split" },
        }
    end,
}
