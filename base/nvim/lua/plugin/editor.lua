local M = {
  { "echasnovski/mini.bufremove", init = function() require("core.utils").load_mappings "minibufremove" end },
  { "max397574/better-escape.nvim", event = "VimEnter", opts = { timeout = 300 } },
  { "karb94/neoscroll.nvim", event = "VeryLazy", config = true },
  { "b0o/schemastore.nvim", enabled = false }, -- TODO: try this out when setting up projects
  { "kylechui/nvim-surround", event = "VeryLazy", config = true },
  { "keaising/im-select.nvim", enabled = false, lazy = false, config = true },
}

return M
