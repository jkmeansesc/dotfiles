local path = "wen.plugins.config"

return {
    {
        "williamboman/mason.nvim",
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
        },
        config = require(path .. ".mason"),
    },

    {
        "nvimtools/none-ls.nvim",
        lazy = true,
        event = { "BufReadPre", "BufNewFile" },
        dependencies = { "jay-babu/mason-null-ls.nvim" },
        config = require(path .. ".none-ls"),
    },

    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            { "antosha417/nvim-lsp-file-operations", config = true },
        },
        config = require(path .. ".nvim-lspconfig"),
    },
}
