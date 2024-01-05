local M = {
  "nvimtools/none-ls.nvim",
  lazy = true,
  event = { "BufReadPre", "BufNewFile" },
  dependencies = { "jay-babu/mason-null-ls.nvim" },
}

function M.config()
  local null_ls = require "null-ls"
  local null_ls_utils = require "null-ls.utils"
  local formatting = null_ls.builtins.formatting
  local diagnostics = null_ls.builtins.diagnostics
  local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

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
      }, -- js/ts formatter
      formatting.stylua, -- lua formatter
      formatting.black, -- python formatter
      formatting.isort, -- python formatter
      formatting.google_java_format, -- java formatter
      diagnostics.pylint, -- python linter
      diagnostics.eslint_d.with { -- js/ts linter
        condition = function(utils)
          return utils.root_has_file { ".eslintrc.js", ".eslintrc.cjs" } -- only enable if root has .eslintrc.js or .eslintrc.cjs
        end,
      },
      diagnostics.markdownlint.with {
        extra_args = { "--disable MD013" }, -- diable rule: line length
      }, -- markdown linter
      diagnostics.ansiblelint, --ansible linter
      diagnostics.hadolint, -- dockerfile linter
    },

    -- configure format on save
    on_attach = function(current_client, bufnr)
      if current_client.supports_method "textDocument/formatting" then
        vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
        vim.api.nvim_create_autocmd("BufWritePre", {
          group = augroup,
          buffer = bufnr,
          callback = function()
            vim.lsp.buf.format {
              bufnr = bufnr,
              filter = function(client)
                --  only use null-ls for formatting instead of lsp server
                return client.name == "null-ls"
              end,
            }
          end,
        })
      end
    end,
  }
end

return M
