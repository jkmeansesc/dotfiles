return function()
    local opts = {
        options = {
            -- stylua: ignore
            close_command = function(n) require("mini.bufremove").delete(n, false) end,
            -- stylua: ignore
            right_mouse_command = function(n) require("mini.bufremove").delete(n, false) end,
            diagnostics = "nvim_lsp",
            always_show_bufferline = false,
            offsets = {
                {
                    filetype = "NvimTree",
                    highlight = "Directory",
                },
            },
        },
    }
    require("bufferline").setup(opts)
end
