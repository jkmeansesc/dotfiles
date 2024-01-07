local M = {
  "folke/which-key.nvim",
  event = "VeryLazy",
}

function M.config()
  local icons = require "core.icons"
  require("which-key").setup {
    icons = { group = "", separator = "" },
    disable = { filetypes = { "TelescopePrompt" } },
  }
  require("which-key").register {
    ["<leader>b"] = { name = icons.Buffer .. " Buffer" },
    ["<leader>g"] = { name = icons.Git .. " Git" },
    ["<leader>f"] = { name = icons.Find .. " Find" },
    ["<leader>l"] = { name = icons.Lsp .. " Lsp" },
    ["<leader>m"] = { name = icons.Manage .. " Manage" },
    ["<leader>j"] = { name = icons.Java .. " Java" },
    ["<leader>d"] = { name = icons.Debug .. " Debug" },
    ["<leader>x"] = { name = icons.Trouble .. " Trouble" },
  }
end

return M
