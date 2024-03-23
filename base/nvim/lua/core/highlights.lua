local M = {}

M.colors = {
  -- ╭──────────────────────────────────────────────────────────╮
  -- │ catppuccin palette                                       │
  -- ╰──────────────────────────────────────────────────────────╯
  rosewater = "#F5E0DC", -- default: #F5E0DC
  flamingo = "#F2CDCD", -- default: #F2CDCD
  pink = "#F5C2E7", -- default: #F5C2E7
  mauve = "#CBA6F7", -- default: #CBA6F7
  red = "#F38BA8", -- default: #F38BA8
  maroon = "#EBA0AC", -- default: #EBA0AC
  peach = "#FAB387", -- default: #FAB387
  yellow = "#F9E2AF", -- default: #F9E2AF
  green = "#A6E3A1", -- default: #A6E3A1
  teal = "#94E2D5", -- default: #94E2D5
  sky = "#89DCEB", -- default: #89DCEB
  sapphire = "#74C7EC", -- default: #74C7EC
  blue = "#89B4FA", -- default: #89B4FA
  lavender = "#B4BEFE", -- default: #B4BEFE
  text = "#CDD6F4", -- default: #CDD6F4
  subtext1 = "#BAC2DE", -- default: #BAC2DE
  subtext0 = "#A6ADC8", -- default: #A6ADC8
  overlay2 = "#9399B2", -- default: #9399B2
  overlay1 = "#7F849C", -- default: #7F849C
  overlay0 = "#6C7086", -- default: #6C7086
  surface2 = "#585B70", -- default: #585B70
  surface1 = "#45475A", -- default: #45475A
  surface0 = "#313244", -- default: #313244
  base = "#0b0b12", -- default: #1E1E2E
  mantle = "#11111a", -- default: #181825
  crust = "#191926", -- default: #11111B
  -- ╭──────────────────────────────────────────────────────────╮
  -- │ custom defined                                           │
  -- ╰──────────────────────────────────────────────────────────╯
  white = "#ffffff",
  innerbg = nil,
  outerbg = nil,
}

local color = M.colors

M.cmp = {
  CmpPmenuBoarder = { fg = color.maroon, bg = color.crust },
  CmpDocBoarder = { fg = color.maroon, bg = color.mantle },
  CmpSel = { fg = color.surface0, bg = color.green },
  CmpPmenu = { bg = color.crust },
  CmpDoc = { bg = color.mantle },
}

M.alpha = {
  AlphaLogoBlue = { fg = color.blue },
  AlphaLogoGreenFBlueB = { fg = color.green, bg = color.blue },
  AlphaLogoGreen = { fg = color.green },
  AlphaHeader = { fg = color.yellow },
  AlphaButtons = { fg = color.lavender },
  AlphaFooter = { fg = color.peach },
  AlphaShortcut = { fg = color.green },
}

return M
