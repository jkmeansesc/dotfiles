local M = {
  "j-hui/fidget.nvim",
  event = { "VimEnter" },
}

function M.config()
  require("fidget").setup {
    notification = {
      override_vim_notify = true, -- Automatically override vim.notify() with Fidget
    },
  }
end

return M
