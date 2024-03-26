-- vim.cmd [[colorscheme catppuccin]]
return {
  "catppuccin/nvim",
  -- enabled = false,
  lazy = false,
  priority = 1000,
  name = "catppuccin",
  config = function()
    local color = require("core.highlights").colors
    require("catppuccin").setup {
      flavour = "mocha",
      transparent_background = false,
      term_colors = true,

      -- NOTE: maintain a list of all the in-use plugins that deviate from default settings.
      integrations = {
        alpha = false,
        cmp = false,
        mason = true,
        treesitter_context = true,
        nvimtree = false,
        which_key = true,
        indent_blankline = {
          enabled = true,
          scope_color = "sapphire", -- default: text
          colored_indent_levels = false,
        },
        fidget = true,
      },

      color_overrides = {
        mocha = {
          base = color.base,
          mantle = color.mantle,
          crust = color.crust,
        },
      },

      highlight_overrides = {
        mocha = function()
          return {
            NormalFloat = { fg = color.text, bg = color.crust },
          }
        end,
      },
    }
  end,
}
