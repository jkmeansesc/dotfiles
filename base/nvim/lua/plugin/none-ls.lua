return {
    "nvimtools/none-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    keys = {
        {
            "<Leader>lf",
            function(bufnr)
                vim.lsp.buf.format { bufnr = bufnr, filter = function(client) return client.name == "null-ls" end }
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
                formatting.google_java_format.with {
                    extra_args = { "--aosp" }, -- 4 space indentation
                }, -- java formatter
                formatting.shfmt, -- shell formatter
                diagnostics.markdownlint.with {
                    extra_args = { "--disable MD013" }, -- diable rule: line length
                }, -- markdown linter
                code_actions.gitsigns, -- git signs code actions
            },
        }
    end,
}
