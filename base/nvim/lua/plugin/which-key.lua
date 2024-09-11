return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
        require("which-key").setup {
            icons = {
                mappings = false, --- disable keymap icons from rules
                group = "", -- symbol prepended to a group
                separator = "",
            },
            disable = { ft = { "TelescopePrompt" } },
            spec = {
                { "<leader>b", group = "[B]uffer" },
                { "<leader>c", group = "[C]ore" },
                { "<leader>d", group = "[D]ebug" },
                { "<leader>f", group = "[F]ind" },
                { "<leader>g", group = "[G]it" },
                { "<leader>l", group = "[L]sp" },
            },
        }
    end,
}
