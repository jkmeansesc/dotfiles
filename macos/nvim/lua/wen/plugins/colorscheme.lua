return {
  {
    "catppuccin/nvim",
    lazy = false,
    priority = 1000,
    name = "catppuccin",
    opts = {
      flavour = "mocha",
      transparent_background = true,
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
        headlines = true,
        indent_blankline = {
          enabled = true,
          scope_color = "", -- catppuccin color (eg. `lavender`) Default: text
          colored_indent_levels = false,
        },
      },
    },
  },

  { "rebelot/kanagawa.nvim", lazy = true },
  { "projekt0n/github-nvim-theme", lazy = true },
  { "bluz71/vim-nightfly-guicolors", lazy = true },
  { "folke/tokyonight.nvim", lazy = true },
  { "NLKNguyen/papercolor-theme", lazy = true },
  { "morhetz/gruvbox", lazy = true },
  { "kepano/flexoki-neovim", lazy = true, name = "flexoki" },
  { "savq/melange-nvim", lazy = true },
  { "ellisonleao/gruvbox.nvim", lazy = true, opts = { transparent_mode = false } },
}
