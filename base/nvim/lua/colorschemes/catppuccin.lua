-- vim.cmd [[colorscheme catppuccin]]
return {
  "catppuccin/nvim",
  -- enabled = false,
  lazy = false,
  priority = 1000,
  name = "catppuccin",
  config = function()
    require("catppuccin").setup {
      flavour = "mocha",
      transparent_background = false,
      term_colors = true,
      styles = {
        comments = { "italic" },
        conditionals = { "italic" },
        misc = {},
      },
      integrations = {
        alpha = false,
        cmp = false,
        gitsigns = true,
        treesitter = true,
        mason = true,
        treesitter_context = true,
        nvimtree = false,
        telescope = {
          enabled = false,
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
      color_overrides = {
        mocha = require("core.highlights").colors,
      },
    }
  end,
}
