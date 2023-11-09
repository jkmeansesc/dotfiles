local map = vim.api.nvim_set_keymap

map("n", "j", "v:count == 0 ? 'gj' : 'j'", { noremap = true, silent = true, expr = true, desc = "Move cursor down" })
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { noremap = true, silent = true, expr = true, desc = "Move cursor up" })
map("n", "<leader>w", "<cmd>w<cr>", { noremap = true, silent = true, desc = "Save" })
map("n", "<leader>q", "<cmd>confirm q<cr>", { noremap = true, silent = true, desc = "Quit" })
map("n", "<leader>n", "<cmd>enew<cr>", { noremap = true, silent = true, desc = "New File" })
map("n", "<C-s>", "<cmd>w!<cr>", { noremap = true, silent = true, desc = "Force write" })
map("n", "<C-q>", "<cmd>qa!<cr>", { noremap = true, silent = true, desc = "Force quit" })
map("n", "|", "<cmd>vsplit<cr>", { noremap = true, silent = true, desc = "Vertical Split" })
map("n", "\\", "<cmd>split<cr>", { noremap = true, silent = true, desc = "Horizontal Split" })
