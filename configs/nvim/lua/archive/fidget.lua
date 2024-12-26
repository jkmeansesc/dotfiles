return {
  "j-hui/fidget.nvim",
  event = { "VimEnter" },
  keys = {
    { "<Leader>ch", "<CMD>Fidget history<CR>", desc = "Fidget history" },
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
          render_limit = 24, -- default + 8
          done_ttl = 6, -- default + 3
        },
      },
    }
  end,
}
