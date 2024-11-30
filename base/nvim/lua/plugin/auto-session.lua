return {
  "rmagatti/auto-session",
  lazy = false,
  keys = {
    { "<Leader>cr", "<CMD>SessionRestore<CR>", desc = "Restore last session" },
  },
  config = function()
    require("auto-session").setup {
      auto_restore = false,
      suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
    }
  end,
}
