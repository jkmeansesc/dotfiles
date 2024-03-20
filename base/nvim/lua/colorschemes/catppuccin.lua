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
        -- rosewater = "#ffd7d9",
        -- flamingo = "#ffb3b8",
        -- pink = "#ff7eb6",
        -- mauve = "#d4bbff",
        -- red = "#fa4d56",
        -- maroon = "#ff8389",
        -- peach = "#ff832b",
        -- yellow = "#fddc69",
        -- green = "#42be65",
        -- teal = "#3ddbd9",
        -- sky = "#82cfff",
        -- sapphire = "#78a9ff",
        -- blue = "#4589ff",
        -- lavender = "#be95ff",
        -- text = "#f4f4f4",
        -- subtext1 = "#e0e0e0",
        -- subtext0 = "#c6c6c6",
        -- overlay2 = "#a8a8a8",
        -- overlay1 = "#8d8d8d",
        -- overlay0 = "#6f6f6f",
        -- surface2 = "#525252",
        -- surface1 = "#393939",
        -- surface0 = "#262626",
        base = "#11111b",
        -- mantle = "#0b0b0b",
        -- crust = "#000000",
      },
    },
  }
end

return M
