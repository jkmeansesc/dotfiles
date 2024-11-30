return {
  "stevearc/oil.nvim",
  keys = {
    { "-", "<CMD>Oil<CR>", desc = "Open parent directory" },
  },
  config = function()
    require("oil").setup {
      delete_to_trash = true,
      skip_confirm_for_simple_edits = true,
      view_options = {
        show_hidden = true,
      },
    }
  end,
}
