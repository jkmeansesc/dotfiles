return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    icons = { group = vim.g.icons_enabled and "" or "+", separator = "" },
    disable = { filetypes = { "TelescopePrompt" } },
  },
  config = function()
    require("which-key").register {
      ["<leader>b"] = { name = " 󰓩.Buffer" },
      ["<leader>s"] = { name = " 󰤼 Split" },
      ["<leader>g"] = { name = "  Git" },
      ["<leader>f"] = { name = "  Find" },
      ["<leader>l"] = { name = "  Lsp" },
      ["<leader>m"] = { name = " 󰏓 Manage" },
      ["<leader>t"] = { name = "  Terminal" },
    }
  end,
}
