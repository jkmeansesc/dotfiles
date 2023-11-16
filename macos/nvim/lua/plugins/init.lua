return {
  { "folke/neodev.nvim", opts = {} },
  { "echasnovski/mini.bufremove" },
  { "max397574/better-escape.nvim", event = "InsertCharPre", opts = { timeout = 300 } },
  { "karb94/neoscroll.nvim", event = "VeryLazy", opts = {} },
  { "NvChad/nvim-colorizer.lua", event = { "BufReadPre", "BufNewFile" }, config = true },
  { "folke/todo-comments.nvim", z { "nvim-lua/plenary.nvim" }, opts = {} },
}
