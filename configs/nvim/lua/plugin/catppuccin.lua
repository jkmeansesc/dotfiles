-- vim.cmd [[colorscheme catppuccin]]
return {
  "catppuccin/nvim",
  -- enabled = false,
  lazy = false,
  priority = 1000,
  name = "catppuccin",
  config = function()
    local palette = require "core.palette"
    local c = palette.catppuccin
    local o = palette.onedark
    local k = palette.kanagawa
    local t = palette.tokyonight

    require("catppuccin").setup {
      flavour = "mocha",
      transparent_background = true,
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
        mocha = require "core.colors",
      },

      highlight_overrides = {
        mocha = function()
          return {
            NormalFloat = { fg = c.text, bg = c.mantle },
            FloatBorder = { fg = c.overlay0, bg = c.mantle },
          }
        end,
      },
    }
    vim.cmd [[colorscheme catppuccin]]
  end,
}
