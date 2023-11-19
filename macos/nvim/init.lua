-- set default options
require "core.options"
require "core.lazy"
vim.cmd [[colorscheme catppuccin]]

-- load mapping
require("core.utils").load_mappings()
