local lazy_status = require "lazy.status"

vim.g.lualine_laststatus = vim.o.laststatus
if vim.fn.argc(-1) > 0 then
    -- set an empty statusline till lualine loads
    vim.o.statusline = " "
else
    -- hide the statusline on the starter page
    vim.o.laststatus = 0
end

require("lualine").setup {
    extensions = { "quickfix", "lazy", "mason", "nvim-dap-ui", "nvim-tree", "toggleterm", "trouble" },
    options = { theme = "catppuccin" },
    sections = {
        lualine_x = {
            {
                M.lazy_status.updates,
                cond = M.lazy_status.has_updates,
                color = { fg = "#ff9e64" },
            },
            { "encoding" },
            { "fileformat" },
            { "filetype" },
        },
    },
}
