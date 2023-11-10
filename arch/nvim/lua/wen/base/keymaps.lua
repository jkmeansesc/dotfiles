vim.g.mapleader = " "

local keymap = vim.keymap

-- Standard Operations
keymap.set(
    "n",
    "j",
    "v:count == 0 ? 'gj' : 'j'",
    { desc = "Move cursor down", noremap = true, silent = true, expr = true }
)
keymap.set(
    "n",
    "k",
    "v:count == 0 ? 'gk' : 'k'",
    { noremap = true, silent = true, expr = true, desc = "Move cursor up" }
)
keymap.set("n", "<leader>w", "<cmd>w<cr>", { desc = "Save", noremap = true, silent = true })
keymap.set("n", "<leader>q", "<cmd>confirm q<cr>", { desc = "Quit", noremap = true, silent = true })
keymap.set("n", "<leader>n", "<cmd>enew<cr>", { desc = "New File", noremap = true, silent = true })
keymap.set("n", "<C-s>", "<cmd>w!<cr>", { desc = "Force write", noremap = true, silent = true })
keymap.set("n", "<C-q>", "<cmd>qa!<cr>", { desc = "Force quit", noremap = true, silent = true })
keymap.set("n", "|", "<cmd>vsplit<cr>", { desc = "Vertical Split", noremap = true, silent = true })
keymap.set("n", "\\", "<cmd>split<cr>", { desc = "Horizontal Split", noremap = true, silent = true })
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })
