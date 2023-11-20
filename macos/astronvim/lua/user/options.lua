-- set vim ons here (vim.<first_key>.<second_key> = value)
return {
  opt = {
    autoread = true, -- automatically read the file if it changes outside of Vim.
    backup = false, -- disable backup files.
    colorcolumn = "80", -- highlight the 80th column.
    hidden = true, -- allow switching between buffers without saving.
    hlsearch = false, -- don’t highlight search results as you type.
    incsearch = true, -- incremental search highlights as you type.
    scrolloff = 10, -- minimum number of lines to keep above and below the cursor.
    sidescrolloff = 10, -- minimum number of columns to keep to the left and right of the cursor.
    shiftround = true, -- round indent to a multiple of 'shiftwidth'.
    softtabstop = 2, -- number of spaces that a <Tab> counts for.
    smartindent = true, -- do smart autoindenting.
    whichwrap = "<,>,[,],h,l", -- allow certain keys to move to the next line or scroll horizontally.
    wildmenu = true, -- enhanced command-line completion.
    list = true, -- show invisible characters.
    listchars = { tab = "│→", extends = "⟩", precedes = "⟨", trail = "·", nbsp = "␣" }, -- configure list characters
    wrap = true,
    showbreak = "↪ ",
  },
}
