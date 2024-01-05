local M = {
  "LunarVim/breadcrumbs.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = { "SmiteshP/nvim-navic" },
  config = true,
}

return M
