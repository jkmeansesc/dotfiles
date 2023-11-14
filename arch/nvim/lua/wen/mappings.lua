local keymap = vim.keymap

local function opts(desc, expr)
    return {
        noremap = true,
        silent = true,
        desc = desc,
        expr = expr or false,
    }
end

vim.g.mapleader = " " -- set leader key
vim.gmaplocalleader = " " -- set default local leader key

-- Basic keymap
keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", opts("Move cursor down", true))
keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", opts("Move cursor up", true))
keymap.set("n", "<leader>w", "<cmd>w<cr>", opts "Save")
keymap.set("n", "<leader>q", "<cmd>confirm q<cr>", opts "Quit")
keymap.set("n", "<leader>n", "<cmd>enew<cr>", opts "New file")
keymap.set("n", "<C-s>", "<cmd>w!<cr>", opts "Force write")
keymap.set("n", "<C-q>", "<cmd>qa!<cr>", opts "Force quit")
keymap.set("i", "jk", "<ESC>", opts "Exit insert mode with jk")

-- Text operations
keymap.set("v", "<", "<gv", opts "Increase indent")
keymap.set("v", ">", ">gv", opts "Decrease indent")
keymap.set("v", "J", ":move '>+1<CR>gv-gv", opts "Move text up")
keymap.set("v", "K", ":move '<-2<CR>gv-gv", opts "Move text down")

-- Window management
keymap.set("n", "|", "<C-w>v", opts "Split window vertically")
keymap.set("n", "\\", "<C-w>s", opts "Split window horizontally")
keymap.set("n", "<leader>s|", "<C-w>v", opts "Split window vertically")
keymap.set("n", "<leader>s\\", "<C-w>s", opts "Split window horizontally")
keymap.set("n", "<leader>s=", "<C-w>=", opts "Make split equal size")
keymap.set("n", "<leader>sc", "<cmd>close<CR>", opts "Close current split")

-- Visual mode paste but don't copy
keymap.set("v", "p", '"_dP', opts "Paste but don't copy")
-- Change text without putting it into the vim register,
-- see https://stackoverflow.com/q/54255/6064933
keymap.set("n", "c", '"_c')
keymap.set("n", "C", '"_C')
keymap.set("n", "cc", '"_cc')
keymap.set("x", "c", '"_c')

-- Copy entire buffer.
keymap.set("n", "<leader>y", "<cmd>%yank<cr>", { desc = "Yank entire buffer" })
-- keymap.set("n", "<leader>a", "gg<S-v>G", opts "Select all")

-- Turn the word under cursor to upper case
keymap.set("i", "<c-u>", "<Esc>viwUea")

-- Turn the current word into title case
keymap.set("i", "<c-t>", "<Esc>b~lea")
