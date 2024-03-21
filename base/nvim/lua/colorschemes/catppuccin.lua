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
    styles = {
      comments = { "italic" },
      conditionals = { "italic" },
      misc = {},
    },
    integrations = {
      aerial = true,
      alpha = true,
      cmp = true,
      gitsigns = true,
      treesitter = true,
      neotree = true,
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
    color_overrides = {
      mocha = {
        rosewater = "#F5B8AB",
        flamingo = "#F29D9D",
        pink = "#AD6FF7",
        mauve = "#FF8F40",
        red = "#E66767",
        maroon = "#EB788B",
        peach = "#FAB770",
        yellow = "#FACA64",
        green = "#70CF67",
        teal = "#4CD4BD",
        sky = "#61BDFF",
        sapphire = "#4BA8FA",
        blue = "#00BFFF",
        -- lavender = "#00BBCC",
        text = "#C1C9E6",
        subtext1 = "#A3AAC2",
        subtext0 = "#8E94AB",
        overlay2 = "#7D8296",
        overlay1 = "#676B80",
        overlay0 = "#464957",
        surface2 = "#3A3D4A",
        surface1 = "#2F313D",
        surface0 = "#1D1E29",
        base = "#11111b",
        mantle = "#181825",
        crust = "#191926",
      },
    },
  }
end

return M
