return function()
  local key = require "which-key"
  key.setup {
    icons = { group = vim.g.icons_enabled and "" or "+", separator = "" },
    disable = { filetypes = { "TelescopePrompt" } },
  }

  key.register {
    ["<leader>b"] = { name = " 󰓩.Buffer" },
    ["<leader>s"] = { name = " 󰤼 Split" },
    ["<leader>g"] = { name = "  Git" },
    ["<leader>f"] = { name = "  Find" },
    ["<leader>l"] = { name = "  Lsp" },
  }
end
