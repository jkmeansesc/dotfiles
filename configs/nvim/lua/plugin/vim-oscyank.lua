return {
  "ojroques/vim-oscyank",
  event = { "BufReadPre", "BufNewFile" },
  keys = {
    { "<Leader>y", "<Plug>OSCYankOperator", mode = "n", desc = "OSCYank" },
    { "<Leader>y", "<Plug>OSCYankVisual", mode = "v", desc = "OSCYank Visual" },
    { "<Leader>Y", "<leader>c_", mode = "n", desc = "OSCYank line", remap = true },
  },
}
