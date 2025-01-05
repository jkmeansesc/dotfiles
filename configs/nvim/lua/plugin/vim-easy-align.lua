return {
  "junegunn/vim-easy-align",
  event = { "BufReadPre", "BufNewFile" },
  keys = {
    { "ga", mode = { "n", "x" }, "<Plug>(EasyAlign)", desc = "EasyAlign" },
  },
}
