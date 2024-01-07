local M = {
  "nvim-tree/nvim-tree.lua",
  -- enabled = false,
  cmd = { "NvimTreeToggle", "NvimTreeFocus" },
  dependencies = { "nvim-tree/nvim-web-devicons" },
  init = function() require("core.utils").load_mappings "nvimtree" end,
}
function M.config()
  local api = require "nvim-tree.api"

  -- h&l operation
  local function on_attach(bufnr)
    local function opts(desc)
      return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end
    api.config.mappings.default_on_attach(bufnr)
    vim.keymap.set("n", "l", api.node.open.edit, opts "Open")
    vim.keymap.set("n", "h", api.node.navigate.parent_close, opts "Close Directory")
  end

  -- automatically open file upon creation
  api.events.subscribe(api.events.Event.FileCreated, function(file) vim.cmd("edit " .. file.fname) end)

  -- auto close if nvim-tree is the last window
  vim.api.nvim_create_autocmd("QuitPre", {
    callback = function()
      local tree_wins = {}
      local floating_wins = {}
      local wins = vim.api.nvim_list_wins()
      for _, w in ipairs(wins) do
        local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(w))
        if bufname:match "NvimTree_" ~= nil then table.insert(tree_wins, w) end
        if vim.api.nvim_win_get_config(w).relative ~= "" then table.insert(floating_wins, w) end
      end
      if 1 == #wins - #floating_wins - #tree_wins then
        -- Should quit, so we close all invalid windows.
        for _, w in ipairs(tree_wins) do
          vim.api.nvim_win_close(w, true)
        end
      end
    end,
  })

  require("nvim-tree").setup {
    on_attach = on_attach,
  }
end

return M
