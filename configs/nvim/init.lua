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
spec "plugin.nvim-treesitter"
spec "plugin.telescope"
spec "plugin.which-key"
spec "plugin.gitsigns"
spec "plugin.vim-fugitive"
spec "plugin.conform"
spec "plugin.nvim-lint"
spec "plugin.blink"
spec "plugin.nvim-lspconfig"
spec "plugin.nvim-dap" -- TODO:

-- ╭──────────────────────────────────────────────────────────╮
-- │ EDITOR                                                   │
-- ╰──────────────────────────────────────────────────────────╯
spec "plugin.nvim-tree"
spec "plugin.better-escape" -- jk means esc
spec "plugin.vim-sleuth" -- automatically adjusts 'shiftwidth' and 'expandtab' heuristically
spec "plugin.smart-splits" -- necessary for tmux navigating across panes
spec "plugin.inc-rename"
spec "plugin.harpoon"
spec "plugin.carbon-now" -- screenshot code
spec "plugin.treesj" -- splitting/joining blocks of code
spec "plugin.pangu" -- auto format to add a space between cjk and english letters
spec "plugin.auto-session"
spec "plugin.nvim-autopairs"
spec "plugin.nvim-ts-autotag"
spec "plugin.nvim-surround"
spec "plugin.mini-ai"
-- spec "plugin.bufdelete"
-- spec "plugin.yanky"
-- spec "plugin.substitute"
spec "plugin.vim-oscyank" -- yank text even from remote
spec "plugin.ts-comments" -- enhance neovim's native comments, neovim natively supports comment now
spec "plugin.snacks"

-- ╭──────────────────────────────────────────────────────────╮
-- │ UI                                                       │
-- ╰──────────────────────────────────────────────────────────╯
spec "plugin.alpha-nvim"
spec "plugin.barbecue" -- VS Code like winbar
spec "plugin.lualine"
spec "plugin.nvim-colorizer"
spec "plugin.vim-illuminate"
spec "plugin.render-markdown"
spec "plugin.todo-comments"
spec "plugin.catppuccin"
spec "plugin.smear-cursor"

----------------------plugins spec end-------------------------

-- bootstrap lazy
require "core.lazy"

-- setup highlights
require "core.highlights"
