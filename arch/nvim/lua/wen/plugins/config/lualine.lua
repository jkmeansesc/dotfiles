return function()
    local opts = {
        extensions = { "quickfix", "lazy", "mason", "nvim-dap-ui", "nvim-tree", "toggleterm", "trouble" },
        options = { theme = "catppuccin" },
    }

    require("lualine").setup(opts)
end
