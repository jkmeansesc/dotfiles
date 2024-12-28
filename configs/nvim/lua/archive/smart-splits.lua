return {
  "mrjones2014/smart-splits.nvim",
  keys = {
    { "<C-S-h>", function() require("smart-splits").resize_left() end, desc = "Resize left" },
    { "<C-S-j>", function() require("smart-splits").resize_down() end, desc = "Resize down" },
    { "<C-S-k>", function() require("smart-splits").resize_up() end, desc = "Resize up" },
    { "<C-S-l>", function() require("smart-splits").resize_right() end, desc = "Resize right" },

    { "<C-h>", function() require("smart-splits").move_cursor_left() end, desc = "Move cursor left" },
    { "<C-j>", function() require("smart-splits").move_cursor_down() end, desc = "Move cursor down" },
    { "<C-k>", function() require("smart-splits").move_cursor_up() end, desc = "Move cursor up" },
    { "<C-l>", function() require("smart-splits").move_cursor_right() end, desc = "Move cursor right" },

    { "<Leader>bh", function() require("smart-splits").swap_buf_left() end, desc = "Swap left" },
    { "<Leader>bj", function() require("smart-splits").swap_buf_down() end, desc = "Swap down" },
    { "<Leader>bk", function() require("smart-splits").swap_buf_up() end, desc = "Swap up" },
    { "<Leader>bl", function() require("smart-splits").swap_buf_right() end, desc = "Swap right" },
  },
  config = function()
    require("smart-splits").setup {
      ignored_filetypes = { "nofile", "quickfix", "qf", "prompt", "NvimTree" },
      ignored_buftypes = { "nofile" },
    }
  end,
}
