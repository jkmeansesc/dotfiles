return {
  "j-hui/fidget.nvim",
  event = { "VimEnter" },
  keys = {
    { "<Leader>h?", "<CMD>Fidget history<CR>", desc = "Fidget history" },
  },
  config = function()
    require("fidget").setup {
      notification = {
        override_vim_notify = true, -- Automatically override vim.notify() with Fidget
      },
    }
  end,
}
