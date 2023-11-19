return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPre", "BufNewFile" },
  init = function(plugin)
    require("lazy.core.loader").add_to_rtp(plugin)
    require "nvim-treesitter.query_predicates"
  end,
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
    "JoosepAlviste/nvim-ts-context-commentstring",
  },
  opts = {
    highlight = {
      enable = true,
      use_languagetree = true,
    },
    indent = { enable = true },
    ensure_installed = {
      "bash",
      "c",
      "css",
      "dockerfile",
      "gitignore",
      "html",
      "java",
      "javascript",
      "jsdoc",
      "json",
      "jsonc",
      "latex",
      "lua",
      "luadoc",
      "luap",
      "markdown",
      "markdown_inline",
      "python",
      "query",
      "regex",
      "toml",
      "tsx",
      "typescript",
      "vim",
      "vimdoc",
      "yaml",
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

    -- enable nvim-ts-context-commentstring plugin for commenting tsx and jsx
    context_commentstring = { enable = true, enable_autocmd = false },
  },
  config = function(_, opts) require("nvim-treesitter.configs").setup { opts } end,
}
