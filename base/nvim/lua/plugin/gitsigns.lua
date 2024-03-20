local M = {
  "lewis6991/gitsigns.nvim",
  ft = { "gitcommit", "diff" },
}

function M.init()
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

  local map = require("core.utils").map
  -- Navigation through hunks
  map("n", "]h", function() require("gitsigns").next_hunk() end, { desc = "Next hunk", expr = true })
  map("n", "[h", function() require("gitsigns").prev_hunk() end, { desc = "Prev hunk", expr = true })

  -- Actions
  map("n", "<Leader>gr", function() require("gitsigns").reset_hunk() end, { desc = "Reset hunk" })
  map("n", "<Leader>gR", function() require("gitsigns").reset_buffer() end, { desc = "Reset buffer" })
  map("n", "<Leader>gp", function() require("gitsigns").preview_hunk() end, { desc = "Preview hunk" })
  map("n", "<Leader>gs", function() require("gitsigns").stage_hunk() end, { desc = "Stage hunk" })
  map("n", "<Leader>gS", function() require("gitsigns").stage_buffer() end, { desc = "Stage buffer" })
  map("n", "<Leader>gu", function() require("gitsigns").undo_stage_hunk() end, { desc = "Undo hunk" })
  map("n", "<Leader>gb", function() require("gitsigns").blame_line() end, { desc = "Blame line" })
  map("n", "<Leader>gB", function() require("gitsigns").blame_line { full = true } end, { desc = "Blame buffer" })
  map("n", "<Leader>gd", function() require("gitsigns").diffthis() end, { desc = "Git diff" })
  map("n", "<Leader>gt", function() require("gitsigns").toggle_current_line_blame() end, { desc = "Toggle line blame" })
end

function M.config()
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
end
return M
