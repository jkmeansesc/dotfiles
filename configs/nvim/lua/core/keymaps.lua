local map = require("core.utils").map

-- basic
map("n", "<Leader>w", ":w!<CR>", { desc = "Save" })
map("n", "<Leader>q", ":qa!<CR>", { desc = "Force quit without saving" })
map("n", "<C-c>", "<CMD>close<CR>", { desc = "Close" })

map("n", "H", ":bprev<CR>", { desc = "Prev buffer", noremap = false })
map("n", "L", ":bnext<CR>", { desc = "Next buffer", noremap = false })

-- go to beginning and end
map("i", "<C-b>", "<ESC>^i", { desc = "Beginning of line" })
map("i", "<C-e>", "<End>", { desc = "End of line" })
map({ "n", "o", "x" }, "B", "^", { desc = "Beginning of line" })
map({ "n", "o", "x" }, "E", "g_", { desc = "End of line" })

-- navigate within insert mode
map("i", "<C-h>", "<Left>", { desc = "Move left" })
map("i", "<C-l>", "<Right>", { desc = "Move right" })
map("i", "<C-j>", "<Down>", { desc = "Move down" })
map("i", "<C-k>", "<Up>", { desc = "Move up" })

-- turn the word under cursor to upper case
map("i", "<C-u>", "<Esc>viwUea", { desc = "Turn into upper case" })
-- turn the current word into title case
map("i", "<C-t>", "<Esc>b~lea", { desc = "Turn into title case" })

-- window management
map("n", "|", "<C-w>v", { desc = "Split vertically" })
map("n", "\\", "<C-w>s", { desc = "Split horizontally" })

-- clear highlights
map("n", "<Esc>", "<CMD>noh<CR>", { desc = "Clear highlights" })

-- Allow moving the cursor through wrapped lines with j, k, <Up> and <Down>
-- http://www.reddit.com/r/vim/comments/2k4cbr/problem_with_gj_and_gk/
-- empty mode is same as using <CMD> :map
-- also don't use g[j|k] when in operator pending mode, so it doesn't alter d, y or c behaviour
map({ "n", "x" }, "j", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { desc = "Move down", expr = true })
map({ "n", "x" }, "k", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { desc = "Move up", expr = true })
map({ "n", "v" }, "<Up>", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { desc = "Move up", expr = true })
map({ "n", "v" }, "<Down>", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { desc = "Move down", expr = true })

-- Line operation
map({ "x", "v" }, "<", "<gv", { desc = "Indent line" })
map({ "x", "v" }, ">", ">gv", { desc = "Indent line" })
map("v", "J", ":move '>+1<CR>gv-gv", { desc = "Move text down" })
map("v", "K", ":move '<-2<CR>gv-gv", { desc = "Move text up" })

-- Don't copy the replaced text after pasting in visual mode
-- https://vim.fandom.com/wiki/Replace_a_word_with_yanked_text#Alternative_mapping_for_paste
map("x", "p", 'p:let @+=@0<CR>:let @"=@0<CR>', { desc = "Don't copy replaced text" })
