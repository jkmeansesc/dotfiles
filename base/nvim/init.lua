-- bootstrap plugin specs
require "core.bootstrap"

-- set default options
require "core.options"

-- load mappings
require "core.keymaps"

----------------------plugins spec start-----------------------
-- ╭──────────────────────────────────────────────────────────╮
-- │ colorschemes                                             │
-- ╰──────────────────────────────────────────────────────────╯
spec "colorschemes.catppuccin"
spec "colorschemes.darkplus"
spec "colorschemes.edge"
spec "colorschemes.flexoki-neovim"
spec "colorschemes.gruvbox"
spec "colorschemes.gruvbox-material"
spec "colorschemes.kanagawa"
spec "colorschemes.material"
spec "colorschemes.melange-nvim"
spec "colorschemes.monokai"
spec "colorschemes.nightfox"
spec "colorschemes.nord"
spec "colorschemes.onedarkpro"
spec "colorschemes.oxocarbon"
spec "colorschemes.papercolor-theme"
spec "colorschemes.rose-pine"
spec "colorschemes.sonokai"
spec "colorschemes.tokyonight"
spec "colorschemes.vim-nightfly-colors"
spec "colorschemes.cyberdream"
spec "colorschemes.citruszest"

-- ╭──────────────────────────────────────────────────────────╮
-- │ UI                                                       │
-- ╰──────────────────────────────────────────────────────────╯
spec "plugin.alpha-nvim"
spec "plugin.barbecue" -- VS Code like winbar
spec "plugin.lualine"
spec "plugin.indent-blankline"
spec "plugin.nvim-colorizer"
spec "plugin.vim-illuminate"

-- ╭──────────────────────────────────────────────────────────╮
-- │ ESSENTIALS                                               │
-- ╰──────────────────────────────────────────────────────────╯
spec "plugin.mason"
spec "plugin.none-ls"
spec "plugin.nvim-cmp"
spec "plugin.nvim-treesitter"
spec "plugin.telescope" -- TODO:
spec "plugin.which-key"
spec "plugin.gitsigns"
spec "plugin.vim-fugitive"

-- ╭──────────────────────────────────────────────────────────╮
-- │ EDITOR                                                   │
-- ╰──────────────────────────────────────────────────────────╯
spec "plugin.nvim-tree"
spec "plugin.better-escape"
spec "plugin.todo-comments"
spec "plugin.comment"
spec "plugin.vim-sleuth" -- automatically adjusts 'shiftwidth' and 'expandtab' heuristically
spec "plugin.smart-splits"
spec "plugin.inc-rename"
spec "plugin.harpoon"
spec "plugin.bufdelete"
spec "plugin.carbon-now" -- screenshot code
spec "plugin.fidget" -- notifications and LSP progress messages.
spec "plugin.toggleterm"
spec "plugin.treesj" -- splitting/joining blocks of code

-- ╭──────────────────────────────────────────────────────────╮
-- │ LSP                                                      │
-- ╰──────────────────────────────────────────────────────────╯
spec "plugin.nvim-lspconfig" -- TODO:
spec "plugin.nvim-jdtls" -- java TODO:
spec "plugin.cmake-tools" -- cpp TODO:
spec "plugin.clangd_extensions" -- cpp TODO:

-- ╭──────────────────────────────────────────────────────────╮
-- │ DAP                                                      │
-- ╰──────────────────────────────────────────────────────────╯
spec "plugin.nvim-dap" -- TODO:

----------------------plugins spec end-------------------------

-- bootstrap lazy
require "core.lazy"

vim.cmd [[colorscheme catppuccin]]
