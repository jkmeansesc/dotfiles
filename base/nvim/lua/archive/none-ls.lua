return {
  "nvimtools/none-ls.nvim",
  event = { "BufReadPre", "BufNewFile" },
  keys = {
    {
      "<Leader>lf",
      function()
        local bufnr = vim.api.nvim_get_current_buf()
        local null_ls = require "null-ls"

        -- Check if null-ls is available and has formatting capability for this filetype
        local null_ls_sources = null_ls.get_sources()
        local has_null_ls_formatter = false
        for _, source in ipairs(null_ls_sources) do
          if source.filetypes[vim.bo.filetype] and source.methods[null_ls.methods.FORMATTING] then
            has_null_ls_formatter = true
            break
          end
        end

        if has_null_ls_formatter then
          vim.lsp.buf.format { bufnr = bufnr, filter = function(client) return client.name == "null-ls" end }
        else
          -- Fall back to any available formatter
          vim.lsp.buf.format { bufnr = bufnr }
        end
      end,
      mode = { "n", "v" },
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
    local code_actions = null_ls.builtins.code_actions

    null_ls.setup {
      root_dir = null_ls_utils.root_pattern(".null-ls-root", "Makefile", ".git", "package.json"),
      sources = {
        formatting.prettier.with {
          filetypes = {
            "svelte",
            "javascript",
            "typescript",
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
        formatting.shfmt, -- shell formatter
        formatting.black, -- python formatter
        diagnostics.mypy, -- python linter
        diagnostics.ruff, -- python linter
        diagnostics.markdownlint.with {
          extra_args = { "--disable MD013" }, -- diable rule: line length
        }, -- markdown linter
        code_actions.gitsigns, -- git signs code actions
      },
    }
  end,
}
