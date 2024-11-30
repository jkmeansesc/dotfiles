return {
  "gbprod/substitute.nvim",
  event = { "BufReadPre", "BufNewFile" },
  keys = {
    { "s", function() require("substitute").operator() end, mode = { "n", "x" }, desc = "Substitute with motion" },
    { "ss", function() require("substitute").line() end, mode = "n", desc = "Substitute line" },
    { "S", function() require("substitute").eol() end, mode = "n", desc = "Substitute to end of line" },
  },
  config = true,
}
