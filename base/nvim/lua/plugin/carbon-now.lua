local M = {
  "ellisonleao/carbon-now.nvim",
  cmd = "CarbonNow",
  config = true,
}
function M.init()
  local map = require("core.utils").map
  map("v", "<leader>hc", ":CarbonNow<CR>", { desc = "Screenshot" })
end

function M.config() require("carbon-now").setup { open_cmd = "open" } end
return M
