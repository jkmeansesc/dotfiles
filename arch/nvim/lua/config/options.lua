vim.opt.viewoptions:remove "curdir" -- disable saving current directory with views
vim.opt.shortmess:append { s = true, I = true } -- disable search count wrap and startup messages
vim.opt.backspace:append { "nostop" } -- don't stop backspace at insert

if vim.fn.has "nvim-0.9" == 1 then
    vim.opt.diffopt:append "linematch:60" -- enable linematch diff algorithm
end

local options = {
    g = {
        mapleader = " ", -- set leader key
        maplocalleader = ",", -- set default local leader key
        encoding = "UTF-8", -- utf8
    },
    opt = {
        autoindent = true, -- copy indent from current line when starting a new line.
        autoread = true, -- automatically read the file if it changes outside of Vim.
        backup = false, -- disable backup files.
        breakindent = true, -- wrap indent to match  line start
        clipboard = "unnamedplus", -- connection to the system clipboard
        cmdheight = 0, -- hide command line unless needed
        colorcolumn = "80", -- highlight the 80th column.
        completeopt = { "menu", "menuone", "noselect", "noinsert" }, -- Options for insert mode completion
        copyindent = true, -- copy the previous indentation on autoindenting
        cursorline = true, -- highlight the text line of the cursor
        expandtab = true, -- enable the use of space in tab
        fileencoding = "utf-8", -- file content encoding for the buffer
        fillchars = { eob = " " }, -- disable `~` on nonexistent lines
        foldcolumn = vim.fn.has "nvim-0.9" == 1 and "1" or nil, -- show foldcolumn in nvim 0.9
        foldenable = true, -- enable fold for nvim-ufo
        foldlevel = 99, -- set high foldlevel for nvim-ufo
        foldlevelstart = 99, -- start with all code unfolded
        hidden = true, -- allow switching between buffers without saving.
        history = 100, -- number of commands to remember in a history table
        hlsearch = false, -- don’t highlight search results as you type.
        ignorecase = true, -- case insensitive searching
        incsearch = true, -- incremental search highlights as you type.
        infercase = true, -- infer cases in keyword completion
        laststatus = 3, -- global statusline
        linebreak = true, -- wrap lines at 'breakat'
        list = true, -- show invisible characters.
        listchars = "space:·", -- display the space character as a dot.
        mouse = "a", -- enable mouse support
        number = true, -- show numberline
        preserveindent = true, -- preserve indent structure as much as possible
        pumheight = 10, -- height of the pop up menu
        relativenumber = true, -- show relative numberline
        scrolloff = 8, -- minimum number of lines to keep above and below the cursor.
        shiftround = true, -- round indent to a multiple of 'shiftwidth'.
        shiftwidth = 4, -- number of space inserted for indentation
        showmode = false, -- disable showing modes in command line
        showtabline = 2, -- always display tabline
        sidescrolloff = 8, -- minimum number of columns to keep to the left and right of the cursor.
        signcolumn = "yes", -- always show the sign column
        smartcase = true, -- case sensitive searching
        smartindent = true, -- do smart autoindenting.
        softtabstop = 4, -- number of spaces that a <Tab> counts for.
        splitbelow = true, -- splitting a new window below the current one
        splitright = true, -- splitting a new window at the right of the current one
        swapfile = false, -- disable swap files.
        tabstop = 4, -- number of space in a tab
        termguicolors = true, -- enable 24-bit RGB color in the TUI
        timeoutlen = 500, -- shorten key timeout length a little bit for which-key
        undofile = true, -- enable persistent undo
        updatetime = 300, -- length of time to wait before triggering the plugin
        virtualedit = "block", -- allow going past end of line in visual block mode
        whichwrap = "<,>,[,],h,l", -- allow certain keys to move to the next line or scroll horizontally.
        wildmenu = true, -- enhanced command-line completion.
        wrap = false, -- disable wrapping of lines longer than the width of window
        writebackup = false, -- disable making a backup before overwriting a file
    },
    t = {},
}

for scope, table in pairs(options) do
    for setting, value in pairs(table) do
        vim[scope][setting] = value
    end
end

-- disable some default providers
for _, provider in ipairs { "node", "perl", "python3", "ruby" } do
    vim.g["loaded_" .. provider .. "_provider"] = 0
end
