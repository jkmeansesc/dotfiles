return function()
    local opts = {
        highlight = { enable = true },
        indent = { enable = true },
        ensure_installed = {
            "bash",
            "c",
            "html",
            "css",
            "javascript",
            "jsdoc",
            "json",
            "jsonc",
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
            "java",
            "latex",
            "dockerfile",
            "gitignore",
        },
        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = "<C-space>",
                node_incremental = "<C-space>",
                scope_incremental = false,
                node_decremental = "<bs>",
            },
        },

        -- enable nvim-ts-context-commentstring plugin for commenting tsx and jsx
        context_commentstring = { enable = true, enable_autocmd = false },
    }
    require("nvim-treesitter.configs").setup(opts)
end
