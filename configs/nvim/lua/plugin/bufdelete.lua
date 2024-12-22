return {
  "famiu/bufdelete.nvim",
  keys = {
    { "D", function() require("bufdelete").bufdelete() end, desc = "Delete buffer" },
  },
}
