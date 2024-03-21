local M = {
  "max397574/better-escape.nvim",
  event = "VimEnter",
}

function M.config()
  require("better_escape").setup {
    mapping = { "jk", "jj" },
    timeout = 250,
  }
end
return M
