local keymap = vim.keymap

keymap.set("n", "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", { desc = "toggle pin" })
keymap.set("n", "<leader>bp", "<cmd>bufferlinegroupclose ungrouped<cr>", { desc = "delete non-pinned buffers" })
keymap.set("n", "<leader>bo", "<cmd>bufferlinecloseothers<cr>", { desc = "delete other buffers" })
keymap.set("n", "<leader>br", "<cmd>bufferlinecloseright<cr>", { desc = "delete buffers to the right" })
keymap.set("n", "<leader>bl", "<cmd>bufferlinecloseleft<cr>", { desc = "delete buffers to the left" })
keymap.set("n", "<S-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "prev buffer" })
keymap.set("n", "<S-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "next buffer" })

require("bufferline").setup {
    options = {
        -- stylua: ignore
        close_command = function(n) require("mini.bufremove").delete(n, false) end,
        -- stylua: ignore
        right_mouse_command = function(n) require("mini.bufremove").delete(n, false) end,
        diagnostics = "nvim_lsp",
        always_show_bufferline = false,
        offsets = {
            {
                filetype = "NvimTree",
                highlight = "Directory",
            },
        },
    },
}
