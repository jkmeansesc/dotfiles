local keymap = vim.keymap
local utils = require "wen.utils"

-- remap space as leader key
keymap.set("", "<Space>", "<Nop>", utils.keymap_opts "Map space to nada")
vim.g.mapleader = " " -- set leader key
vim.g.maplocalleader = " " -- set default local leader key

-- basic keymap
keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", utils.keymap_opts("Move cursor down", true))
keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", utils.keymap_opts("Move cursor up", true))
keymap.set("n", "<leader>w", "<cmd>w<cr>", utils.keymap_opts "Save")
keymap.set("n", "<leader>q", "<cmd>confirm q<cr>", utils.keymap_opts "Quit")
keymap.set("n", "<leader>n", "<cmd>enew<cr>", utils.keymap_opts "New file")
keymap.set("n", "<leader>a", "gg<S-v>G", utils.keymap_opts "Select all")
keymap.set("n", "<C-s>", "<cmd>w!<cr>", utils.keymap_opts "Force write")
keymap.set("n", "<C-q>", "<cmd>qa!<cr>", utils.keymap_opts "Force quit")
keymap.set("i", "jk", "<ESC>", utils.keymap_opts "Exit insert mode with jk")

-- text operations
keymap.set("v", "<", "<gv", utils.keymap_opts "Increase indent")
keymap.set("v", ">", ">gv", utils.keymap_opts "Decrease indent")
keymap.set("v", "J", ":move '>+1<CR>gv-gv", utils.keymap_opts "Move text up")
keymap.set("v", "K", ":move '<-2<CR>gv-gv", utils.keymap_opts "Move text down")

-- window management
keymap.set("n", "|", "<cmd>vsplit<cr>", utils.keymap_opts "Vertical Split")
keymap.set("n", "\\", "<cmd>split<cr>", utils.keymap_opts "Horizontal Split")
keymap.set("n", "<C-h>", "<C-w>h", utils.keymap_opts "Cursor focus window left")
keymap.set("n", "<C-j>", "<C-w>j", utils.keymap_opts "Cursor focus window down")
keymap.set("n", "<C-k>", "<C-w>k", utils.keymap_opts "Cursor focus window up")
keymap.set("n", "<C-l>", "<C-w>l", utils.keymap_opts "Cursor focus window right")

-- Visual mode paste but don't copy
keymap.set("v", "p", '"_dP', utils.keymap_opts "Paste but don't copy")
