local M = {
  "SmiteshP/nvim-navic",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = { { "LunarVim/breadcrumbs.nvim", config = true } },
}

function M.config()
  local icons = require("core.icons").navic
  require("nvim-navic").setup {
    icons = icons,
    highlight = true,
    lsp = {
      auto_attach = true,
    },
    click = true,
  }
end
return M
