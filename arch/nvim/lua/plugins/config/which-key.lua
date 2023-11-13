vim.o.timeout = true
vim.o.timeoutlen = 300

local key = require "which-key"
key.setup {
    icons = { group = vim.g.icons_enabled and "" or "+", separator = "" },
    disable = { filetypes = { "TelescopePrompt" } },
}

key.register {
    ["<leader>b"] = { name = " 󰓩.Buffer" },
    ["<leader>s"] = { name = " 󰤼 Split" },
    ["<leader>g"] = { name = "  Git" },
    ["gc"] = { name = "comment toggle linewise" },
    ["gb"] = { name = "comment toggle blockwise" },
}
