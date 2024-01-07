local M = {
  "folke/which-key.nvim",
  event = "VeryLazy",
}

function M.config()
  require("which-key").setup {
    icons = { group = "", separator = "" },
    disable = { filetypes = { "TelescopePrompt" } },
  }
  require("which-key").register {
    ["<leader>b"] = { name = "󰓩.Buffer" },
    ["<leader>g"] = { name = " Git" },
    ["<leader>f"] = { name = " Find" },
    ["<leader>l"] = { name = " Lsp" },
    ["<leader>m"] = { name = "󰏓 Manage" },
    ["<leader>t"] = { name = " Terminal" },
    ["<leader>j"] = { name = "󰬷 Java" },
    ["<leader>d"] = { name = " Debug" },
    ["<leader>x"] = { name = "󰌵 Trouble" },
  }
end

return M
