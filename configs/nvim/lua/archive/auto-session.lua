return {
  "rmagatti/auto-session",
  cmd = { "SessionRestore", "SessionSearch" },
  keys = {
    { "<Leader>cS", "<CMD>SessionRestore<CR>", desc = "Restore last session" },
    { "<Leader>cs", "<CMD>SessionSearch<CR>", desc = "Restore last session" },
  },
  config = function()
    require("auto-session").setup {
      auto_restore = false,
      suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
    }
  end,
}
