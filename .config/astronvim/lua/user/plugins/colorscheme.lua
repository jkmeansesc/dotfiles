return {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
        flavour = "mocha",
        transparent_background = false,
        term_colors = false,
        integrations = {
            alpha = true,
            cmp = true,
            gitsigns = true,
            treesitter = true,
            neotree = true,
            mini = {
                enabled = true,
                indentscope_color = "",
            },
            mason = true,
            notify = true,
            treesitter_context = true,
            telescope = {
                enabled = true,
                style = "nvchad",
            },
            which_key = true,
            lsp_trouble = true,
            headlines = true,
        },
    },
}
