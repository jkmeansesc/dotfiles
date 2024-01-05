-- set default options
require "core.options"

-- bootstrap plugin specs
LAZY_PLUGIN_SPEC = {}
local spec = function(item) table.insert(LAZY_PLUGIN_SPEC, { import = item }) end

----------plugins start----------

-- colorschemes
-- spec "plugin.catppuccin"
-- spec "plugin.material"
-- spec "plugin.kanagawa"
-- spec "plugin.vim-nightfly-color"
-- spec "plugin.tokyonight"
-- spec "plugin.papercolor-theme"
-- spec "plugin.flexoki-neovim"
-- spec "plugin.melange-nvim"
-- spec "plugin.gruvbox"
-- spec "plugin.edge"
-- spec "plugin.sonokai"
-- spec "plugin.gruvbox-material"
-- spec "plugin.nord"
-- spec "plugin.nightfox"
-- spec "plugin.onedarkpro"
-- spec "plugin.monokai"
-- spec "plugin.rose-pine"
spec "plugin.darkplus"

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
-- spec "plugin.neo-tree"
spec "plugin.nvim-tree"
spec "plugin.none-ls"
spec "plugin.nvim-cmp"
spec "plugin.nvim-treesitter"
spec "plugin.telescope"
spec "plugin.toggleterm"
spec "plugin.which-key"

-- EDITOR
spec "plugin.editor"
spec "plugin.todo-comments"
spec "plugin.comment"
spec "plugin.inc-rename"
spec "plugin.guess-indent"
spec "plugin.noice"
spec "plugin.smart-splits"

-- LSP
spec "plugin.nvim-lspconfig"
spec "plugin.nvim-jdtls"
spec "plugin.cmake-tools"
spec "plugin.clangd_extensions"

-- DAP
spec "plugin.nvim-dap"

----------plugins end------------

-- bootstrap lazy
require "core.lazy"

-- load mapping
require("core.utils").load_mappings()
