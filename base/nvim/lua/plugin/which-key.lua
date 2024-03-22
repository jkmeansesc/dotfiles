return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    icons = { group = "", separator = "" },
    disable = { filetypes = { "TelescopePrompt" } },
  },
  config = function()
    local icons = require "core.icons"
    require("which-key").register {
      ["<leader>b"] = { name = icons.Buffer .. " Buffer" },
      ["<leader>d"] = { name = icons.Debug .. " Debug" },
      ["<leader>f"] = { name = icons.Find .. " Find" },
      ["<leader>g"] = { name = icons.Git .. " Git" },
      ["<leader>h"] = { name = icons.Misc .. " Misc" },
      ["<leader>j"] = { name = icons.Java .. " Java" },
      ["<leader>l"] = { name = icons.Lsp .. " Lsp" },
      ["<leader>m"] = { name = icons.Manage .. " Manage" },
    }
  end,
}
