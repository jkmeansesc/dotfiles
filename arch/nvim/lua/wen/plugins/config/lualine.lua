local opts = {
    extensions = { "quickfix", "lazy", "mason", "nvim-dap-ui", "nvim-tree", "toggleterm", "trouble" },
    options = { theme = "catppuccin" },
}

return function(_, opts) require("lualine").setup(opts) end
