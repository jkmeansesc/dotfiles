-- set default options
require "core.options"

-- load mappings
require "core.keymaps"

-- bootstrap plugin specs
LAZY_PLUGIN_SPEC = {}
local spec = function(item) table.insert(LAZY_PLUGIN_SPEC, { import = item }) end

----------plugins spec start----------

-- colorschemes
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

-- UI
spec "plugin.alpha-nvim"
spec "plugin.barbecue" -- VS Code like winbar
spec "plugin.lualine"
spec "plugin.indent-blankline"
spec "plugin.nvim-colorizer"
spec "plugin.vim-illuminate"

-- CORE
spec "plugin.gitsigns"
spec "plugin.mason"
spec "plugin.nvim-tree"
spec "plugin.none-ls"
spec "plugin.nvim-cmp"
spec "plugin.nvim-treesitter"
spec "plugin.telescope"
spec "plugin.which-key"
spec "plugin.vim-fugitive"

-- EDITOR
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

-- LSP
spec "plugin.nvim-lspconfig"
spec "plugin.nvim-jdtls" -- java
spec "plugin.cmake-tools" -- cpp
spec "plugin.clangd_extensions" -- cpp

-- DAP
spec "plugin.nvim-dap"

----------plugins spec end------------

-- bootstrap lazy
require "core.lazy"

vim.cmd [[colorscheme catppuccin]]
