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
    "nvim-treesitter/nvim-treesitter-context",
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

  require("treesitter-context").setup()
end

return M
