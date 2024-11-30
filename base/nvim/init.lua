-- bootstrap plugin specs
LAZY_PLUGIN_SPEC = {}
function spec(item) table.insert(LAZY_PLUGIN_SPEC, { import = item }) end

-- set default options
require "core.options"

-- load mappings
require "core.keymaps"

----------------------plugins spec start-----------------------

-- ╭──────────────────────────────────────────────────────────╮
-- │ ESSENTIALS                                               │
-- ╰──────────────────────────────────────────────────────────╯
spec "plugin.nvim-cmp"
spec "plugin.nvim-treesitter"
spec "plugin.telescope"
spec "plugin.which-key"
spec "plugin.gitsigns"
spec "plugin.vim-fugitive"
spec "plugin.conform"
spec "plugin.nvim-lint"
spec "plugin.nvim-lspconfig"
spec "plugin.nvim-dap" -- TODO:

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
spec "plugin.pangu" -- 自动格式化、规范化中文排版
spec "plugin.auto-session"
spec "plugin.nvim-autopairs"
spec "plugin.nvim-surround"
spec "plugin.yanky"
spec "plugin.substitute"

-- ╭──────────────────────────────────────────────────────────╮
-- │ UI                                                       │
-- ╰──────────────────────────────────────────────────────────╯
spec "plugin.alpha-nvim"
spec "plugin.barbecue" -- VS Code like winbar
spec "plugin.lualine"
spec "plugin.indent-blankline"
spec "plugin.nvim-colorizer"
spec "plugin.vim-illuminate"
spec "plugin.render-markdown"
spec "plugin.catppuccin"

----------------------plugins spec end-------------------------

-- bootstrap lazy
require "core.lazy"

vim.cmd [[colorscheme catppuccin]]
