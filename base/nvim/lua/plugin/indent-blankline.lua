return {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local hooks = require "ibl.hooks"
        hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_space_indent_level)
        require("ibl").setup {
            indent = { char = "│" },
            scope = { char = "│", show_start = false, show_end = false },
            exclude = {
                filetypes = {
                    "startify",
                    "aerial",
                    "alpha",
                    "dashboard",
                    "lazy",
                    "neogitstatus",
                    "NvimTree",
                    "neo-tree",
                    "Trouble",
                },
            },
        }
    end,
}
