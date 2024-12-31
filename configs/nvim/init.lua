-- bootstrap plugin specs
LAZY_PLUGIN_SPEC = {}
function spec(item) table.insert(LAZY_PLUGIN_SPEC, { import = item }) end

-- set default options
require "core.options"

-- load mappings
require "core.keymaps"

-- load autocmd
require "core.autocmd"

---------------------
-- ESSENTIALS
---------------------
spec "plugin.nvim-treesitter"
spec "plugin.telescope"
spec "plugin.nvim-tree"
spec "plugin.which-key"
spec "plugin.blink"
spec "plugin.conform"
spec "plugin.nvim-lint"
spec "plugin.nvim-lspconfig"
-- spec "plugin.nvim-dap" -- TODO:

---------------------
-- EDITOR
---------------------
spec "plugin.vim-fugitive"
spec "plugin.gitsigns"
spec "plugin.vim-tmux-navigator"
spec "plugin.carbon-now" -- screenshot code
spec "plugin.pangu" -- auto format to add a space between cjk and english letters
spec "plugin.nvim-autopairs"
spec "plugin.nvim-ts-autotag"
spec "plugin.nvim-surround"
spec "plugin.mini-ai"
spec "plugin.vim-oscyank" -- yank text even from remote
spec "plugin.ts-comments" -- enhance neovim's native comments, neovim natively supports comment now
spec "plugin.snacks"

---------------------
-- UI
---------------------
spec "plugin.barbecue" -- VS Code like winbar
spec "plugin.lualine"
spec "plugin.nvim-colorizer"
spec "plugin.render-markdown"
spec "plugin.todo-comments"
spec "plugin.catppuccin"
spec "plugin.smear-cursor"

-- bootstrap lazy
require "core.lazy"

-- setup highlights
require "core.highlights"
