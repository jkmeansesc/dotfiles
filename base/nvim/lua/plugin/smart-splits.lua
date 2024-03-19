local M = {
  "mrjones2014/smart-splits.nvim",
  opts = {
    ignored_filetypes = { "nofile", "quickfix", "qf", "prompt" },
    ignored_buftypes = { "nofile" },
  },
}

function M.init()
  local map = require("core.utils").map
  map("n", "<A-h>", function() require("smart-splits").resize_left() end, { desc = "Resize left" })
  map("n", "<A-j>", function() require("smart-splits").resize_down() end, { desc = "Resize down" })
  map("n", "<A-k>", function() require("smart-splits").resize_up() end, { desc = "Resize up" })
  map("n", "<A-l>", function() require("smart-splits").resize_right() end, { desc = "Resize right" })

  map("n", "<C-h>", function() require("smart-splits").move_cursor_left() end, { desc = "Move cursor left" })
  map("n", "<C-j>", function() require("smart-splits").move_cursor_down() end, { desc = "Move cursor down" })
  map("n", "<C-k>", function() require("smart-splits").move_cursor_up() end, { desc = "Move cursor up" })
  map("n", "<C-l>", function() require("smart-splits").move_cursor_right() end, { desc = "Move cursor right" })

  map("n", "<Leader>bh", function() require("smart-splits").swap_buf_left() end, { desc = "Swap left" })
  map("n", "<Leader>bj", function() require("smart-splits").swap_buf_down() end, { desc = "Swap down" })
  map("n", "<Leader>bk", function() require("smart-splits").swap_buf_up() end, { desc = "Swap up" })
  map("n", "<Leader>bl", function() require("smart-splits").swap_buf_right() end, { desc = "Swap right" })
end

return M
