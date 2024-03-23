return {
  "nvimtools/none-ls.nvim",
  event = { "BufReadPre", "BufNewFile" },
  keys = {
    {
      "<Leader>lf",
      function(bufnr)
        vim.lsp.buf.format { bufnr = bufnr, filter = function(client) return client.name == "null-ls" end }
      end,
      desc = "Format",
    },
  },
  dependencies = {
    "jay-babu/mason-null-ls.nvim",
    "nvimtools/none-ls-extras.nvim",
  },
  config = function()
    local null_ls = require "null-ls"
    local null_ls_utils = require "null-ls.utils"
    local formatting = null_ls.builtins.formatting
    local diagnostics = null_ls.builtins.diagnostics

    null_ls.setup {
      root_dir = null_ls_utils.root_pattern(".null-ls-root", "Makefile", ".git", "package.json"),
      sources = {
        formatting.prettier.with {
          filetypes = {
            "svelte",
            "javascript",
            "javascriptreact",
            "typescript",
            "typescriptreact",
            "vue",
            "css",
            "scss",
            "less",
            "html",
            "json",
            "jsonc",
            "yaml",
            "graphql",
            "handlebars",
            "markdown",
          },
        },
        formatting.stylua, -- lua formatter
        formatting.google_java_format, -- java formatter
        formatting.shfmt, -- shell formatter
        diagnostics.markdownlint.with {
          extra_args = { "--disable MD013" }, -- diable rule: line length
        }, -- markdown linter
      },
    }
  end,
}
