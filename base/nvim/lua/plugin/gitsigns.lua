return {
  "lewis6991/gitsigns.nvim",
  ft = { "gitcommit", "diff" },
  init = function()
    -- load gitsigns only when a git file is opened
    vim.api.nvim_create_autocmd({ "BufRead" }, {
      group = vim.api.nvim_create_augroup("GitSignsLazyLoad", { clear = true }),
      callback = function()
        vim.fn.system("git -C " .. '"' .. vim.fn.expand "%:p:h" .. '"' .. " rev-parse")
        if vim.v.shell_error == 0 then
          vim.api.nvim_del_augroup_by_name "GitSignsLazyLoad"
          vim.schedule(function() require("lazy").load { plugins = { "gitsigns.nvim" } } end)
        end
      end,
    })
  end,
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
      { "<Leader>gr", function() gs.reset_hunk() end, desc = "Reset hunk" },
      { "<Leader>gR", function() gs.reset_buffer() end, desc = "Reset buffer" },
      { "<Leader>gp", function() gs.preview_hunk() end, desc = "Preview hunk" },
      { "<Leader>gs", function() gs.stage_hunk() end, desc = "Stage hunk" },
      { "<Leader>gS", function() gs.stage_buffer() end, desc = "Stage buffer" },
      { "<Leader>gu", function() gs.undo_stage_hunk() end, desc = "Undo hunk" },
      { "<Leader>gb", function() gs.blame_line() end, desc = "Blame line" },
      { "<Leader>gB", function() gs.blame_line { full = true } end, desc = "Blame buffer" },
      { "<Leader>gd", function() gs.diffthis() end, desc = "Git diff" },
      { "<Leader>gt", function() gs.toggle_current_line_blame() end, desc = "Toggle line blame" },
    }
  end,
  config = function()
    require("gitsigns").setup {
      signs = {
        add = { text = "▎" },
        change = { text = "▎" },
        delete = { text = "󰍵" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
        untracked = { text = "▎" },
      },
    }
  end,
}
