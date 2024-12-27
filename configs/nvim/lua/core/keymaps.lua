local map = require("core.utils").map

-- basic
map("n", "<Leader>w", ":w!<CR>", { desc = "Save" })
map("n", "<Leader>q", ":qa!<CR>", { desc = "Quit No Save" })
map("n", "<C-c>", "<CMD>close<CR>", { desc = "Close" })

map("n", "H", ":bprev<CR>", { desc = "Prev Buffer", noremap = false })
map("n", "L", ":bnext<CR>", { desc = "Next Buffer", noremap = false })

-- go to beginning and end
map("i", "<C-b>", "<ESC>^i", { desc = "Beginning of Line" })
map("i", "<C-e>", "<End>", { desc = "End of Line" })
map({ "n", "o", "x" }, "B", "^", { desc = "Beginning of Line" })
map({ "n", "o", "x" }, "E", "g_", { desc = "End of Line" })

-- Delete the character to the right of the cursor
map("i", "<C-D>", "<DEL>")

-- navigate within insert mode
map("i", "<C-h>", "<Left>", { desc = "Move Left" })
map("i", "<C-l>", "<Right>", { desc = "Move Right" })
map("i", "<C-j>", "<Down>", { desc = "Move Down" })
map("i", "<C-k>", "<Up>", { desc = "Move Up" })

-- turn the word under cursor to upper case
map("i", "<C-u>", "<Esc>viwUea", { desc = "Turn Into Upper Case" })
-- turn the current word into title case
map("i", "<C-t>", "<Esc>b~lea", { desc = "Turn Into Title Case" })

-- window management
map("n", "|", "<C-w>v", { desc = "Split Vertically" })
map("n", "\\", "<C-w>s", { desc = "Split Horizontally" })

-- clear highlights
map("n", "<Esc>", "<CMD>noh<CR>", { desc = "Clear Highlights" })

-- Allow moving the cursor through wrapped lines with j, k, <Up> and <Down>
-- http://www.reddit.com/r/vim/comments/2k4cbr/problem_with_gj_and_gk/
-- empty mode is same as using <CMD> :map
-- also don't use g[j|k] when in operator pending mode, so it doesn't alter d, y or c behaviour
map({ "n", "x" }, "j", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { desc = "Move Down", expr = true })
map({ "n", "x" }, "k", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { desc = "Move Up", expr = true })
map({ "n", "v" }, "<Up>", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { desc = "Move Up", expr = true })
map({ "n", "v" }, "<Down>", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { desc = "Move Down", expr = true })

-- Line operation
map({ "x", "v" }, "<", "<gv", { desc = "Indent Line" })
map({ "x", "v" }, ">", ">gv", { desc = "Indent Line" })
map("v", "J", ":move '>+1<CR>gv-gv", { desc = "Move Text Down" })
map("v", "K", ":move '<-2<CR>gv-gv", { desc = "Move Text Up" })

-- Change text without putting it into register,
-- see https://stackoverflow.com/q/54255/6064933
map("n", "c", '"_c')
map("n", "C", '"_C')
map("n", "cc", '"_cc')
map("x", "c", '"_c')

-- Don't copy the replaced text after pasting in visual mode
-- https://vim.fandom.com/wiki/Replace_a_word_with_yanked_text#Alternative_mapping_for_paste
map("x", "p", 'p:let @+=@0<CR>:let @"=@0<CR>', { desc = "Don't Copy Replaced Text" })
