return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    dependencies = { "echasnovski/mini.icons", "nvim-tree/nvim-web-devicons" },
    config = function()
        require("which-key").setup {
            icons = { group = "", separator = "" },
            disable = { ft = { "TelescopePrompt" } },
        }

        require("which-key").add {
            { "<leader>b", group = " Buffer" },
            { "<leader>d", group = " Debug" },
            { "<leader>f", group = " Find" },
            { "<leader>g", group = " Git" },
            { "<leader>h", group = " Misc" },
            { "<leader>j", group = " Java" },
            { "<leader>l", group = " Lsp" },
            { "<leader>m", group = " Manage" },
        }
    end,
}
