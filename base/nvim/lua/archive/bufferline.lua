local M = {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
}
function M.init()
    local map = require("core.utils").map
    map("n", "<Leader>bt", "<CMD>BufferLineTogglePin<CR>", { desc = "Toggle pin" })
    map("n", "<Leader>bp", "<CMD>BufferLineGroupCloseUngrouped<CR>", { desc = "Close non-pinned buffers" })
    map("n", "<Leader>bo", "<CMD>BufferLineCloseOthers<CR>", { desc = "Close other buffers" })
    map("n", "<Leader>br", "<CMD>BufferLineCloseRight<CR>", { desc = "Close buffers to the right" })
    map("n", "<Leader>bl", "<CMD>BufferLineCloseLeft<CR>", { desc = "Close buffers to the left" })
    map("n", "<S-h>", "<CMD>BufferLineCyclePrev<CR>", { desc = "Prev buffer" })
    map("n", "<S-l>", "<CMD>BufferLineCycleNext<CR>", { desc = "Next buffer" })
end

M.opts = {
    options = {
        close_command = function() require("core.utils").close() end,
        right_mouse_command = function() require("core.utils").close() end,
        diagnostics = "nvim_lsp",
        always_show_bufferline = true,
        separater_style = "thin",
        offsets = {
            {
                filetype = "neo-tree",
                highlight = "Directory",
                text = "File Explorer",
                text_align = "center",
            },
        },
    },
    highlights = {
        fill = {
            bg = {
                attribute = "fg",
                highlight = "000000",
            },
        },
    },
}

return M
