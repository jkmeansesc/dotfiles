return {
    "Wansmer/treesj",
    keys = { "J", "<cmd>TSJToggle<cr>", desc = "Join Toggle" },
    config = function()
        require("treesj").setup {
            use_default_keymaps = false,
            max_join_length = 150,
        }
    end,
}
