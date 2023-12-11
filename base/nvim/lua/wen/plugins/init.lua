return {
  { "echasnovski/mini.bufremove", init = function() require("wen.core.utils").load_mappings "minibufremove" end },
  { "folke/neodev.nvim", config = true },
  { "max397574/better-escape.nvim", event = "InsertCharPre", opts = { timeout = 300 } },
  { "karb94/neoscroll.nvim", enabled = false, event = "VeryLazy", opts = {} },
  { "NvChad/nvim-colorizer.lua", event = { "BufReadPre", "BufNewFile" }, config = true },
  { "folke/todo-comments.nvim", dependencies = { "nvim-lua/plenary.nvim" }, config = true },
  { "b0o/schemastore.nvim", enabled = false }, -- TODO: try this out when setting up projects
  { "kylechui/nvim-surround", event = "VeryLazy", config = true },
  { "piersolenski/wtf.nvim", dependencies = { "MunifTanjim/nui.nvim" } },
}
