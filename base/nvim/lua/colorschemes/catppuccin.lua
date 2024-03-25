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

      -- NOTE: maintain a list of all the plugins in use that deviates from default settings.
      integrations = {
        alpha = false,
        cmp = false,
        mason = true,
        treesitter_context = true,
        nvimtree = false,
        which_key = true,
        indent_blankline = {
          enabled = true,
          scope_color = "sky", -- default: text
          colored_indent_levels = false,
        },
        fidget = true,
      },
      color_overrides = {
        mocha = require("core.highlights").colors,
      },
    }
  end,
}
