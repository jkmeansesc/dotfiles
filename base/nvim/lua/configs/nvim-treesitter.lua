return {
  highlight = {
    enable = true,
    use_languagetree = true,
  },
  indent = { enable = true },
  ensure_installed = {
    -- general
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
    -- markdown
    "markdown",
    "markdown_inline",
    -- java
    "java",
    -- c++
    "c",
    "cpp",
    "objc",
    "cuda",
    "proto",
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
