return {
    "j-hui/fidget.nvim",
    event = { "VimEnter" },
    keys = {
        { "<Leader>ch", "<CMD>Fidget history<CR>", desc = "Fidget history" },
    },
    config = function()
        require("fidget").setup {
            notification = {
                window = {
                    winblend = 30, -- required by catppuccin
                },
                override_vim_notify = true,
            },
            progress = {
                display = {
                    done_icon = "",
                },
            },
        }
    end,
}
