return {
  "ellisonleao/carbon-now.nvim",
  cmd = "CarbonNow",
  keys = {
    { "<leader>hc", ":CarbonNow<CR>", mode = "v", desc = "Screenshot" },
  },
  config = function() require("carbon-now").setup { open_cmd = "open" } end,
}
