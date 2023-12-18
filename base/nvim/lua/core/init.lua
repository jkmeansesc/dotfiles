if vim.fn.has "nvim-0.9" == 1 then
  vim.opt.diffopt:append "linematch:60" -- enable linematch diff algorithm
end

-- disable some default providers
for _, provider in ipairs { "node", "perl", "python3", "ruby" } do
  vim.g["loaded_" .. provider .. "_provider"] = 0
end

vim.g.encoding = "UTF-8" -- utf8
vim.g.mapleader = " " -- set leader key
vim.g.gmaplocalleader = " " -- set default local leader key

vim.g.git_worktrees = {
  toplevel = vim.env.HOME .. "/git/dotfiles",
  gitdir = vim.env.HOME .. "/git/dotfiles/macos/nvim",
}

vim.opt.autoindent = true -- copy indent from current line when starting a new line.
vim.opt.autoread = true -- automatically read the file if it changes outside of Vim.
vim.opt.backup = false -- disable backup files.
vim.opt.breakindent = true -- wrap indent to match  line start
vim.opt.clipboard = "unnamedplus" -- connection to the system clipboard
vim.opt.cmdheight = 0 -- hide command line unless needed
vim.opt.colorcolumn = "80" -- highlight the 80th column.
-- vim.opt.completeopt = { "menu", "menuone", "noselect" } -- Options for insert mode completion
vim.opt.copyindent = true -- copy the previous indentation on autoindenting
vim.opt.cursorline = true -- highlight the text line of the cursor
vim.opt.expandtab = true -- enable the use of space in tab
vim.opt.fileencoding = "utf-8" -- file content encoding for the buffer
vim.opt.fillchars = { eob = " " } -- disable `~` on nonexistent lines
vim.opt.hidden = true -- allow switching between buffers without saving.
vim.opt.history = 100 -- number of commands to remember in a history table
vim.opt.hlsearch = true -- highlight search results as you type.
vim.opt.ignorecase = true -- case insensitive searching
vim.opt.incsearch = true -- incremental search highlights as you type.
vim.opt.infercase = true -- infer cases in keyword completion
vim.opt.laststatus = 3 -- global statusline
vim.opt.linebreak = true -- wrap lines at 'breakat'
vim.opt.list = true -- show invisible characters.
-- vim.opt.listchars = "space:·" -- display the space character as a dot.
vim.opt.mouse = "a" -- enable mouse support
vim.opt.preserveindent = true -- preserve indent structure as much as possible
vim.opt.pumheight = 10 -- height of the pop up menu

vim.opt.number = true -- show numberline
vim.opt.relativenumber = true -- show relative numberline

vim.opt.shiftround = true -- round indent to a multiple of 'shiftwidth'.
vim.opt.showmode = false -- disable showing modes in command line
vim.opt.signcolumn = "yes" -- always show the sign column
vim.opt.smartcase = true -- case sensitive searching
vim.opt.smartindent = true -- do smart autoindenting.
vim.opt.showtabline = 2 -- always display tabline
vim.opt.shiftwidth = 2 -- number of space inserted for indentation
vim.opt.softtabstop = 2 -- number of spaces that a <Tab> counts for.
vim.opt.tabstop = 2 -- number of space in a tab
vim.opt.scrolloff = 15 -- minimum number of lines to keep above and below the cursor.
vim.opt.sidescrolloff = 8 -- minimum number of columns to keep to the left and right of the cursor.
vim.opt.splitbelow = true -- splitting a new window below the current one
vim.opt.splitright = true -- splitting a new window at the right of the current one
vim.opt.swapfile = false -- disable swap files.
vim.opt.termguicolors = true -- enable 24-bit RGB color in the TUI
vim.opt.undofile = true -- enable persistent undo
vim.opt.updatetime = 300 -- length of time to wait before triggering the plugin
vim.opt.virtualedit = "block" -- allow going past end of line in visual block mode
vim.opt.wildmenu = true -- enhanced command-line completion.
vim.opt.writebackup = false -- disable making a backup before overwriting a file

vim.opt.timeout = true
vim.opt.timeoutlen = 400 -- shorten key timeout length a little bit for which-key

vim.opt.whichwrap = "<,>,[,],h,l" -- allow certain keys to move to the next line or scroll horizontally.
vim.opt.viewoptions:remove "curdir" -- disable saving current directory with views
vim.opt.shortmess:append { s = true, I = true } -- disable search count wrap and startup messages
vim.opt.backspace:append { "nostop" } -- don't stop backspace at insert

vim.opt.wrap = true -- soft wrap lines
vim.opt.showbreak = "↪ "
