local M = {
  "utilyre/barbecue.nvim",
  name = "barbecue",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "SmiteshP/nvim-navic",
    "nvim-tree/nvim-web-devicons",
  },
}

function M.config()
  -- triggers CursorHold event faster
  vim.opt.updatetime = 200

  require("barbecue").setup {
    create_autocmd = false, -- prevent barbecue from updating itself automatically
  }

  vim.api.nvim_create_autocmd({
    "WinScrolled", -- or WinResized on NVIM-v0.9 and higher
    "BufWinEnter",
    "CursorHold",
    "InsertLeave",
  }, {
    group = vim.api.nvim_create_augroup("barbecue.updater", {}),
    callback = function() require("barbecue.ui").update() end,
  })
end

return M
