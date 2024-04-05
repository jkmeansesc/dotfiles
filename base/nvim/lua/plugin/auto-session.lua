return {
  "rmagatti/auto-session",
  lazy = false,
  keys = {
    { "<Leader>hr", "<CMD>SessionRestore<CR>", desc = "Restore last session" },
  },
  config = function()
    require("auto-session").setup {
      auto_restore_enabled = false,
      auto_session_suppress_dirs = {
        "~/",
        "~/Documents",
        "~/Downloads",
        "~/Desktop",
        "/",
      },
    }
  end,
}
