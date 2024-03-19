-- vim.cmd [[colorscheme catppuccin]]
local M = {
  "catppuccin/nvim",
  -- enabled = false,
  lazy = false,
  priority = 1000,
  name = "catppuccin",
}

function M.config()
  require("catppuccin").setup {
    flavour = "mocha",
    transparent_background = false,
    term_colors = true,
    integrations = {
      aerial = true,
      alpha = true,
      cmp = true,
      gitsigns = true,
      treesitter = true,
      neotree = true,
      mini = {
        enabled = true,
        indentscope_color = "",
      },
      mason = true,
      notify = true,
      noice = true,
      treesitter_context = true,
      telescope = {
        enabled = true,
        style = "nvchad",
      },
      which_key = true,
      indent_blankline = {
        enabled = true,
        scope_color = "lavender", -- catppuccin color (eg. `lavender`) Default: text
        colored_indent_levels = false,
      },
      illuminate = {
        enabled = true,
        lsp = false,
      },
    },
  }
end

return M
