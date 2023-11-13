local M = {}

M.init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
end

M.opts = {
    icons = { group = vim.g.icons_enabled and "" or "+", separator = "" },
    disable = { filetypes = { "TelescopePrompt" } },
}

return M
