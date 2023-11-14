return function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300

    local key = require "which-key"
    key.setup {
        icons = { group = vim.g.icons_enabled and "" or "+", separator = "" },
        disable = { filetypes = { "TelescopePrompt" } },
    }

    key.register {
        ["<leader>b"] = { name = " 󰓩.buffer" },
        ["<leader>s"] = { name = " 󰤼 split" },
        ["<leader>g"] = { name = "  git" },
        ["<leader>f"] = { name = "  telescope" },
        ["<leader>l"] = { name = "  lsp" },
        ["gc"] = { name = "comment toggle linewise" },
        ["gb"] = { name = "comment toggle blockwise" },
    }
end
