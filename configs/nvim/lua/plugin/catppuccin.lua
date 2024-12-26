-- vim.cmd [[colorscheme catppuccin]]
return {
  "catppuccin/nvim",
  -- enabled = false,
  lazy = false,
  priority = 1000,
  name = "catppuccin",
  config = function()
    local c = require "core.colors"
    require("catppuccin").setup {
      flavour = "mocha",
      transparent_background = true,
      term_colors = true,

      -- NOTE: maintain a list of all the in-use plugins that deviate from default settings.
      integrations = {
        alpha = true,
        mason = true,
        treesitter_context = true,
        nvimtree = true,
        which_key = true,
        blink_cmp = true,
        snacks = true,
        render_markdown = true,
      },

      color_overrides = {
        mocha = require "core.colors",
      },

      highlight_overrides = {
        mocha = function()
          return {
            NormalFloat = { fg = c.lavender, bg = c.crust },
            FloatBorder = { fg = c.crust, bg = c.crust },
            FloatTitle = { fg = c.lavender, bg = c.crust },
            NonText = { fg = c.surface0 },
          }
        end,
      },
    }
    vim.cmd [[colorscheme catppuccin]]
  end,
}
