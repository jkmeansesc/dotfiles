return {
  "utilyre/barbecue.nvim",
  name = "barbecue",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "SmiteshP/nvim-navic",
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    vim.opt.updatetime = 200
    vim.api.nvim_create_autocmd({
      "WinResized", --[[ "WinScrolled", ]] -- or WinResized on NVIM-v0.9 and higher
      "BufWinEnter",
      "CursorHold",
      "InsertLeave",
    }, {
      group = vim.api.nvim_create_augroup("barbecue.updater", {}),
      callback = function() require("barbecue.ui").update() end,
    })
    require("barbecue").setup {
      theme = "tokyonight",
      create_autocmd = false, -- prevent barbecue from updating itself automatically
    }
  end,
}
