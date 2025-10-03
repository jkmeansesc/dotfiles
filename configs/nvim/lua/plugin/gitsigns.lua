return {
  "lewis6991/gitsigns.nvim",
  ft = { "gitcommit", "diff" },
  keys = function()
    local gs = require "gitsigns"
    return {
      {
        "]h",
        function()
          if vim.wo.diff then return "]h" end
          vim.schedule(function() gs.next_hunk() end)
          return "<Ignore>"
        end,
        desc = "Next hunk",
        expr = true,
      },
      {
        "[h",
        function()
          if vim.wo.diff then return "[h" end
          vim.schedule(function() gs.prev_hunk() end)
          return "<Ignore>"
        end,
        desc = "Prev hunk",
        expr = true,
      },
      { "<Leader>gr", function() gs.reset_hunk() end, desc = "[R]eset Hunk" },
      { "<Leader>gR", function() gs.reset_buffer() end, desc = "[R]eset Buffer" },
      { "<Leader>gp", function() gs.preview_hunk() end, desc = "[P]review Hunk" },
      { "<Leader>gs", function() gs.stage_hunk() end, desc = "[S]tage Hunk" },
      { "<Leader>gS", function() gs.stage_buffer() end, desc = "[S]tage Buffer" },
      { "<Leader>gu", function() gs.undo_stage_hunk() end, desc = "[U]ndo Hunk" },
      -- { "<Leader>gb", function() gs.blame_line() end, desc = "[B]lame Line" }, -- NOTE: use snacks
      { "<Leader>gB", function() gs.blame_line { full = true } end, desc = "[B]lame Buffer" },
      { "<Leader>gd", function() gs.diffthis() end, desc = "Git [D]iff" },
      { "<Leader>gt", function() gs.toggle_current_line_blame() end, desc = "[T]oggle Line Blame" },
    }
  end,
  opts = {
    signs = {
      add = { text = "▎" },
      change = { text = "▎" },
      delete = { text = "▎" },
      topdelete = { text = "" },
      changedelete = { text = "▎" },
      untracked = { text = "▎" },
    },
    signs_staged = {
      add = { text = "▎" },
      change = { text = "▎" },
      delete = { text = "▎" },
      topdelete = { text = "" },
      changedelete = { text = "▎" },
    },
  },
}
