return {
  "Wansmer/treesj",
  keys = {
    { "<leader>j", "<CMD>TSJJoin<CR>", desc = "Join Line" },
    { "<leader>J", "<CMD>TSJSplit<CR>", desc = "Split Line" },
  },
  config = function()
    require("treesj").setup {
      use_default_keymaps = false,
      max_join_length = 150,
    }
  end,
}
