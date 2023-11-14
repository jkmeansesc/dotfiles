return function()
    vim.o.timeout = true
    vim.o.timeoutlen = 500

    local key = require "which-key"
    key.setup {
        icons = { group = vim.g.icons_enabled and "" or "+", separator = "" },
        disable = { filetypes = { "TelescopePrompt" } },
    }

    key.register {
        ["<leader>b"] = { name = " 󰓩.Buffer" },
        ["<leader>s"] = { name = " 󰤼 Split" },
        ["<leader>g"] = { name = "  Git" },
        ["<leader>f"] = { name = "  Telescope" },
        ["<leader>l"] = { name = "  Lsp" },
        -- ["gc"] = { name = "Comment toggle linewise" },
        -- ["gb"] = { name = "Comment toggle blockwise" },
    }
end
