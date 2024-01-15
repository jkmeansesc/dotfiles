-- vim.cmd [[colorscheme onedark]]
local M = {
  "navarasu/onedark.nvim",
  enable = false,
  lazy = false,
  priority = 1000,
}

function M.config()
  require("onedark").setup {
    style = "darker", -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
    transparent = false, -- Show/hide background
  }
end
return M
