local map = require("core.utils").map

-- go to beginning and end
map("i", "<C-b>", "<ESC>^i", { desc = "Beginning of line" })
map("i", "<C-e>", "<End>", { desc = "End of line" })

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
map("n", "<C-c>", "<CMD>close<CR>", { desc = "Close" })

-- save
map("n", "<C-s>", "<CMD>update<CR>", { desc = "Save" })

-- Do not move my cursor when joining lines. NOTE: replaced by treesj
-- map("n", "J", function()
--   vim.cmd [[
--     normal! mzJ`z
--     delmarks z]]
-- end, { desc = "Join line" })

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

-- Insert a blank line below or above current line (do not move the cursor),
-- see https://stackoverflow.com/a/16136134/6064933
map("n", "<Leader>o", "printf('m`%so<ESC>``', v:count1)", { desc = "Insert line below", expr = true })
map("n", "<Leader>O", "printf('m`%sO<ESC>``', v:count1)", { desc = "Insert line above", expr = true })

-- copy all
map("n", "<Leader>y", "<CMD>%y+<CR>", { desc = "Yank all" })

-- quit
map("n", "<Leader>q", "<CMD>x<CR>", { desc = "Save and Quit" })
map("n", "<Leader>Q", "<CMD>wqa!<CR>", { desc = "Save and Quit (Force)" })

-- buffer management
map("n", "<Leader>bb", "<CMD>enew<CR>", { desc = "New buffer" })

-- Package management
map("n", "<Leader>cl", "<CMD>Lazy<CR>", { desc = "Lazy" })
map("n", "<Leader>cm", "<CMD>Mason<CR>", { desc = "Mason" })
map("n", "<Leader>ci", "<CMD>LspInfo<CR>", { desc = "LSP information" })
map("n", "<Leader>cn", "<CMD>NullLsInfo<CR>", { desc = "Null-ls information" })

-- Line operation
map({ "x", "v" }, "<", "<gv", { desc = "Indent line" })
map({ "x", "v" }, ">", ">gv", { desc = "Indent line" })
map("v", "J", ":move '>+1<CR>gv-gv", { desc = "Move text down" })
map("v", "K", ":move '<-2<CR>gv-gv", { desc = "Move text up" })

-- Don't copy the replaced text after pasting in visual mode
-- https://vim.fandom.com/wiki/Replace_a_word_with_yanked_text#Alternative_mapping_for_paste
map("x", "p", 'p:let @+=@0<CR>:let @"=@0<CR>', { desc = "Don't copy replaced text" })
