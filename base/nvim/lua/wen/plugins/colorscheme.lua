return {
  {
    "catppuccin/nvim",
    lazy = true,
    priority = 1000,
    name = "catppuccin",
    opts = {
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
          -- style = "nvchad",
        },
        which_key = true,
        indent_blankline = {
          enabled = true,
          scope_color = "", -- catppuccin color (eg. `lavender`) Default: text
          colored_indent_levels = false,
        },
        illuminate = {
          enabled = true,
          lsp = false,
        },
      },
    },
  },
  {
    "marko-cerovac/material.nvim",
    lazy = true,
    -- priority = 1000,
    config = function()
      vim.g.material_style = "deep ocean"
      require("material").setup {
        plugins = { -- Uncomment the plugins that you use to highlight them
          -- Available plugins:
          "dap",
          -- "dashboard",
          -- "eyeliner",
          -- "fidget"
          -- "flash"
          "gitsigns",
          -- "harpoon",
          -- "hop",
          "illuminate",
          "indent-blankline",
          "lspsaga",
          -- "mini",
          -- "neogit",
          -- "neotest",
          -- "neorg",
          "noice",
          "nvim-cmp",
          -- "nvim-navic",
          -- "nvim-tree",
          "nvim-web-devicons",
          -- "rainbow-delimiters",
          -- "sneak",
          "telescope",
          -- "trouble",
          "which-key",
        },
      }
    end,
  },
  { "rebelot/kanagawa.nvim", lazy = true },
  { "bluz71/vim-nightfly-colors", name = "nightfly", lazy = true },
  { "folke/tokyonight.nvim", lazy = true },
  { "NLKNguyen/papercolor-theme", lazy = true },
  { "kepano/flexoki-neovim", lazy = true, name = "flexoki" },
  { "savq/melange-nvim", lazy = true },
  { "ellisonleao/gruvbox.nvim", lazy = true, opts = { transparent_mode = false } },
  { "sainnhe/edge", lazy = true },
  { "sainnhe/sonokai", lazy = true },
  { "sainnhe/gruvbox-material", lazy = true },
  { "shaunsingh/nord.nvim", lazy = true },
  { "EdenEast/nightfox.nvim", lazy = false, priority = 1000 },
  { "olimorris/onedarkpro.nvim", lazy = true },
  { "tanvirtin/monokai.nvim", lazy = true },
  { "rose-pine/neovim", name = "rose-pine", lazy = true },
}
