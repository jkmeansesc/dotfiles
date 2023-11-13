local M = {}

M.init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
end

M.opts = {
    icons = { group = vim.g.icons_enabled and "" or "+", separator = "" },
    disable = { filetypes = { "TelescopePrompt" } },
}

M.config = function()
    require("which-key").register {
        ["<leader>b"] = { name = " 󰓩.Buffer" },
        ["<leader>s"] = { name = " 󰤼 Split" },
        ["<leader>g"] = { name = "  Git" },
    }
end

return M
