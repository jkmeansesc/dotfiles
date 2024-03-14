local M = {
  "ellisonleao/carbon-now.nvim",
  cmd = "CarbonNow",
  config = true,
}

function M.config() require("carbon-now").setup { open_cmd = "open" } end
return M
