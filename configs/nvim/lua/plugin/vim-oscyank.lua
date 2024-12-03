return {
  "ojroques/vim-oscyank",
  event = { "BufReadPre", "BufNewFile" },
  keys = {
    { "<Leader>y", "<Plug>OSCYankOperator", mode = { "n", "v" }, desc = "OSCYank" },
    { "<Leader>Y", "<leader>c_", mode = "n", desc = "OSCYank line", remap = true },
  },
}
