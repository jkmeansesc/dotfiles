-- set default options
require "core.options"

-- load mapping
require("core.utils").load_mappings()

-- bootstrap plugin specs
LAZY_PLUGIN_SPEC = {}
local spec = function(item) table.insert(LAZY_PLUGIN_SPEC, { import = item }) end

----------plugins spec start----------

-- colorschemes
spec "plugin.colorschemes.catppuccin"
spec "plugin.colorschemes.material"
spec "plugin.colorschemes.kanagawa"
spec "plugin.colorschemes.vim-nightfly-colors"
spec "plugin.colorschemes.tokyonight"
spec "plugin.colorschemes.papercolor-theme"
spec "plugin.colorschemes.flexoki-neovim"
spec "plugin.colorschemes.melange-nvim"
spec "plugin.colorschemes.gruvbox"
spec "plugin.colorschemes.edge"
spec "plugin.colorschemes.sonokai"
spec "plugin.colorschemes.gruvbox-material"
spec "plugin.colorschemes.nord"
spec "plugin.colorschemes.nightfox"
spec "plugin.colorschemes.onedarkpro"
spec "plugin.colorschemes.monokai"
spec "plugin.colorschemes.rose-pine"
spec "plugin.colorschemes.darkplus"
spec "plugin.colorschemes.oxocarbon"

-- UI
spec "plugin.alpha-nvim"
-- spec "plugin.bufferline"
spec "plugin.nvim-navic" -- together
spec "plugin.breadcrumbs" -- together
spec "plugin.lualine"
spec "plugin.indent-blankline"
spec "plugin.nvim-colorizer"
spec "plugin.vim-illuminate"

-- CORE
spec "plugin.gitsigns"
spec "plugin.mason"
spec "plugin.neo-tree"
-- spec "plugin.nvim-tree"
spec "plugin.none-ls"
spec "plugin.nvim-cmp"
spec "plugin.nvim-treesitter"
spec "plugin.telescope"
spec "plugin.toggleterm"
spec "plugin.which-key"
spec "plugin.trouble"
spec "plugin.vim-fugitive"

-- EDITOR
spec "plugin.editor"
spec "plugin.todo-comments"
spec "plugin.comment"
spec "plugin.guess-indent"
spec "plugin.noice"
spec "plugin.smart-splits"
spec "plugin.ssr"
spec "plugin.harpoon"

-- LSP
spec "plugin.nvim-lspconfig"
spec "plugin.nvim-jdtls"
spec "plugin.cmake-tools"
spec "plugin.clangd_extensions"

-- DAP
spec "plugin.nvim-dap"

----------plugins spec end------------

-- bootstrap lazy
require "core.lazy"

vim.cmd [[colorscheme catppuccin]]
