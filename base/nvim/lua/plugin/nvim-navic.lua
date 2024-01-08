local M = {
  "SmiteshP/nvim-navic",
  commit = "0ffa7ffe6588f3417e680439872f5049e38a24db",
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
