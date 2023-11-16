-- set vim ons here (vim.<first_key>.<second_key> = value)
return {
  g = {
    mapleader = " ", -- sets vim.g.mapleader
    maplocalleader = " ", -- set default local leader key
    encoding = "UTF-8", -- utf8
  },

  opt = {
    backspace = "indent,eol,start", -- configure backspace behavior
    autoindent = true, -- copy indent from current line when starting a new line.
    autoread = true, -- automatically read the file if it changes outside of Vim.
    backup = false, -- disable backup files.
    colorcolumn = "80", -- highlight the 80th column.
    list = true, -- show invisible characters.
    listchars = { tab = "│→", extends = "⟩", precedes = "⟨", trail = "·", nbsp = "␣" }, -- configure list characters
    hidden = true, -- allow switching between buffers without saving.
    hlsearch = false, -- don’t highlight search results as you type.
    incsearch = true, -- incremental search highlights as you type.
    scrolloff = 15, -- minimum number of lines to keep above and below the cursor.
    sidescrolloff = 15, -- minimum number of columns to keep to the left and right of the cursor.
    shiftround = true, -- round indent to a multiple of 'shiftwidth'.
    shiftwidth = 4, -- number of space inserted for indentation
    softtabstop = 4, -- number of spaces that a <Tab> counts for.
    smartindent = true, -- do smart autoindenting.
    smartcase = true, -- case sensitive searching
    whichwrap = "<,>,[,],h,l", -- allow certain keys to move to the next line or scroll horizontally.
    wildmenu = true, -- enhanced command-line completion.
    showbreak = "↪ ",
    wrap = true,
  },
}
