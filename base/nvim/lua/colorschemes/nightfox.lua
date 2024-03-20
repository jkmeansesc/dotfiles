-- vim.cmd [[colorscheme nightfox]]
-- vim.cmd [[colorscheme dayfox]]
-- vim.cmd [[colorscheme dawnfox]]
-- vim.cmd [[colorscheme nordfox]]
-- vim.cmd [[colorscheme terafox]]
-- vim.cmd [[colorscheme carbonfox]]

local M = {
  "EdenEast/nightfox.nvim",
  enabled = false,
  lazy = false,
  priority = 1000,
}

function M.config()
  require("nightfox").setup {
    options = {
      transparent = false, -- Disable setting background
      dim_inactive = false, -- Non focused panes set to alternative background
      styles = {
        comments = "italic",
        keywords = "bold",
        types = "italic,bold",
      },
      modules = { -- List of various plugins and additional options
      },
    },
  }
end

return M
