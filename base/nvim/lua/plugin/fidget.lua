return {
  "j-hui/fidget.nvim",
  event = { "VimEnter" },
  keys = {
    { "<Leader>h?", "<CMD>Fidget history<CR>", desc = "Fidget history" },
  },
  config = function()
    require("fidget").setup {
      notification = {
        window = {
          winblend = 0, -- required by catppuccin
        },
        override_vim_notify = true,
      },
      progress = {
        display = {
          done_icon = "",
        },
      },
    }
  end,
}
