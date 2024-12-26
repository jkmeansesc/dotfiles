vim.g.mapleader = " "
vim.g.gmaplocalleader = ","

-- set utf-8
vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

vim.opt.number = true -- show numberline
vim.opt.relativenumber = true -- show relative numberline

vim.opt.mouse = "a" -- enable mouse support
vim.opt.laststatus = 3 -- global statusline
vim.opt.cmdheight = 0 -- height of the command bar, default: 1
vim.opt.backup = false -- disable backup

vim.opt.showmode = false -- disable showing modes in command line
vim.opt.smartindent = true -- do smart autoindenting.

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.foldlevel = 99
vim.opt.fillchars = {
  foldopen = "",
  foldclose = "",
  fold = " ",
  foldsep = " ",
  diff = "╱",
  eob = " ",
}

vim.opt.undofile = true -- enable persistent undo

vim.opt.signcolumn = "yes" -- always show the sign column

vim.opt.updatetime = 250 -- length of time to wait before triggering the plugin

vim.opt.timeoutlen = 300 -- shorten key timeout length for which-key

vim.opt.splitbelow = true -- splitting a new window below the current one
vim.opt.splitright = true -- splitting a new window at the right of the current one

vim.opt.list = true -- show invisible characters.
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

vim.opt.cursorline = true -- highlight the text line of the cursor
vim.opt.breakindent = true -- wrap indent to match line start
vim.opt.clipboard = "unnamedplus" -- connection to the system clipboard
vim.opt.confirm = true -- Confirm to save changes before exiting modified buffer

vim.opt.inccommand = "split" -- preview substitutions live

vim.opt.scrolloff = 15 -- minimum number of lines to keep above and below the cursor.

vim.opt.hlsearch = true -- highlight search results as you type.

vim.opt.expandtab = true -- enable the use of space in tab
vim.opt.shiftwidth = 2 -- number of space inserted for indentation
vim.opt.softtabstop = 2 -- number of spaces that a <Tab> counts for.
vim.opt.tabstop = 2 -- number of space in a tab

vim.opt.wrap = true -- soft wrap lines
vim.opt.showbreak = "↪ "

vim.opt.spelllang = "en_us,en_gb,cjk"
vim.opt.spell = true

vim.opt.whichwrap = "<,>,[,],h,l" -- allow certain keys to move to the next line or scroll horizontally.

-- disable some default providers
vim.g["loaded_node_provider"] = 0
vim.g["loaded_perl_provider"] = 0
vim.g["loaded_ruby_provider"] = 0
vim.g["loaded_python3_provider"] = 0

-- add binaries installed by mason.nvim to path
---@diagnostic disable-next-line: undefined-field
local is_windows = vim.loop.os_uname().sysname == "Windows_NT"
vim.env.PATH = vim.fn.stdpath "data" .. "/mason/bin" .. (is_windows and ";" or ":") .. vim.env.PATH
