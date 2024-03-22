return {
  "j-hui/fidget.nvim",
  event = { "VimEnter" },
  opts = {
    notification = {
      override_vim_notify = true, -- Automatically override vim.notify() with Fidget
    },
  },
}
