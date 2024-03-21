local M = {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPre", "BufNewFile" },
  init = function(plugin)
    require("lazy.core.loader").add_to_rtp(plugin)
    require "nvim-treesitter.query_predicates"
  end,
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
    "nvim-treesitter/treesitter-context",
    "luckasRanarison/tree-sitter-hyprlang",
  },
}

function M.config()
  require("nvim-treesitter.configs").setup {
    highlight = {
      enable = true,
      use_languagetree = true,
    },
    indent = { enable = true },
    ensure_installed = {
      "bash",
      "css",
      "dockerfile",
      "gitignore",
      "html",
      "javascript",
      "jsdoc",
      "json",
      "jsonc",
      "latex",
      "lua",
      "luadoc",
      "luap",
      "python",
      "query",
      "regex",
      "toml",
      "tsx",
      "typescript",
      "vim",
      "vimdoc",
      "yaml",
      "markdown",
      "markdown_inline",
      "java",
      "c",
      "cpp",
      "objc",
      "cuda",
      "proto",
      "hyprlang", -- hyprland parser
    },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<CR>",
        node_incremental = "<CR>",
        node_decremental = "<BS>",
        scope_incremental = false,
      },
    },
  }
  require("treesitter-context").setup {
    enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
    max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
    min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
    line_numbers = true,
    multiline_threshold = 20, -- Maximum number of lines to show for a single context
    trim_scope = "outer", -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
    mode = "cursor", -- Line used to calculate context. Choices: 'cursor', 'topline'
    -- Separator between context and content. Should be a single character string, like '-'.
    -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
    separator = nil,
    zindex = 20, -- The Z-index of the context window
    on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
  }
end

return M
