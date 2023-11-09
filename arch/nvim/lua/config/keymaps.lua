vim.g.mapleader = " "

local keymap = vim.keymap
keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { noremap = true, silent = true, expr = true, desc = "Move cursor down" })
keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { noremap = true, silent = true, expr = true, desc = "Move cursor up" })
keymap.set("n", "<leader>w", "<cmd>w<cr>", { noremap = true, silent = true, desc = "Save" })
keymap.set("n", "<leader>q", "<cmd>confirm q<cr>", { noremap = true, silent = true, desc = "Quit" })
keymap.set("n", "<leader>n", "<cmd>enew<cr>", { noremap = true, silent = true, desc = "New File" })
keymap.set("n", "<C-s>", "<cmd>w!<cr>", { noremap = true, silent = true, desc = "Force write" })
keymap.set("n", "<C-q>", "<cmd>qa!<cr>", { noremap = true, silent = true, desc = "Force quit" })
keymap.set("n", "|", "<cmd>vsplit<cr>", { noremap = true, silent = true, desc = "Vertical Split" })
keymap.set("n", "\\", "<cmd>split<cr>", { noremap = true, silent = true, desc = "Horizontal Split" })
