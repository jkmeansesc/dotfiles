-- set vim ons here (vim.<first_key>.<second_key> = value)
return {
    opt = {
        -- set to true or false etc.
        relativenumber = true, -- sets vim.relativenumber
        number = true, -- sets vim.number
        spell = false, -- sets vim.spell
        signcolumn = "auto", -- sets vim.signcolumn to auto
        wrap = false, -- sets vim.wrap
        -- file encoding
        fileencoding = "utf-8",
        -- tabs & indentation
        tabstop = 4,
        shiftwidth = 4,
        expandtab = true,
        autoindent = true,
        -- search settings
        ignorecase = true,
        smartcase = true,
        incsearch = true,
        hlsearch = false,
        -- cursor line
        cursorline = true,
        -- appearance
        termguicolors = true,
        background = "dark",
        -- backspace
        backspace = "indent,eol,start",
        -- scroll settings
        scrolloff = 15,
        -- misc settings
        updatetime = 50,
        colorcolumn = "80",
    },
    g = {
        mapleader = " ", -- sets vim.g.mapleader
        autoformat_enabled = true, -- enable or disable auto formatting at start (lsp.formatting.format_on_save must be enabled)
        cmp_enabled = true, -- enable completion at start
        autopairs_enabled = true, -- enable autopairs at start
        diagnostics_mode = 3, -- set the visibility of diagnostics in the UI (0=off, 1=only show in status line, 2=virtual text off, 3=all on)
        icons_enabled = true, -- disable icons in the UI (disable if no nerd font is available, requires :PackerSync after changing)
        ui_notifications_enabled = true, -- disable notifications when toggling UI elements
        resession_enabled = false, -- enable experimental resession.nvim session management (will be default in AstroNvim v4)
    },
}
