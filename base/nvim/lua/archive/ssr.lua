-- Structural search and replace for Neovim.
-- https://github.com/cshuaimin/ssr.nvim
local M = {
  "cshuaimin/ssr.nvim",
  name = "ssr",
}

function M.init()
  local map = require("core.utils").map
  map({ "n", "v", "x" }, "<Leader>r", function() require("ssr").open() end, { desc = "Open SSR" })
end

function M.config()
  require("ssr").setup {
    border = "rounded",
    min_width = 50,
    min_height = 5,
    max_width = 120,
    max_height = 25,
    adjust_window = true,
    keymaps = {
      close = "q",
      next_match = "n",
      prev_match = "N",
      replace_confirm = "<cr>",
      replace_all = "<leader><cr>",
    },
  }
end

return M
