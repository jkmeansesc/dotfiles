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
  base = "#11111B", -- default: #1E1E2E
  mantle = "#191926", -- default: #181825
  crust = "#0B0B12", -- default: #11111B
  -- ╭──────────────────────────────────────────────────────────╮
  -- │ custom defined                                           │
  -- ╰──────────────────────────────────────────────────────────╯
  white = "#ffffff",
  innerbg = nil,
  outerbg = nil,
}

local color = M.colors

M.cmp = {
  CmpPmenuBoarder = { fg = color.pink, bg = color.crust },
  CmpDocBoarder = { fg = color.pink, bg = color.mantle },
  CmpSel = { fg = color.surface0, bg = color.green, bold = true },
  CmpPmenu = { bg = color.crust },
  CmpDoc = { bg = color.mantle },

  CmpItemKindCopilot = { fg = color.green, bg = "NONE" },

  CmpItemAbbrDeprecated = { fg = color.surface0, bg = "NONE", strikethrough = true },
  CmpItemAbbrMatch = { fg = color.blue, bg = "NONE", bold = true },
  CmpItemAbbrMatchFuzzy = { fg = color.blue, bg = "NONE", bold = true },
  CmpItemMenu = { fg = color.mauve, bg = "NONE" },

  CmpItemKindField = { fg = color.rosewater, bg = "NONE" },
  CmpItemKindProperty = { fg = color.rosewater, bg = "NONE" },
  CmpItemKindEvent = { fg = color.rosewater, bg = "NONE" },

  CmpItemKindText = { fg = color.text, bg = "NONE" },
  CmpItemKindEnum = { fg = color.text, bg = "NONE" },
  CmpItemKindKeyword = { fg = color.text, bg = "NONE" },

  CmpItemKindConstant = { fg = color.yellow, bg = "NONE" },
  CmpItemKindConstructor = { fg = color.yellow, bg = "NONE" },
  CmpItemKindReference = { fg = color.yellow, bg = "NONE" },

  CmpItemKindFunction = { fg = color.mauve, bg = "NONE" },
  CmpItemKindStruct = { fg = color.mauve, bg = "NONE" },
  CmpItemKindClass = { fg = color.mauve, bg = "NONE" },
  CmpItemKindModule = { fg = color.mauve, bg = "NONE" },
  CmpItemKindOperator = { fg = color.mauve, bg = "NONE" },

  CmpItemKindVariable = { fg = color.subtext0, bg = "NONE" },
  CmpItemKindFile = { fg = color.subtext0, bg = "NONE" },

  CmpItemKindUnit = { fg = color.flamingo, bg = "NONE" },
  CmpItemKindSnippet = { fg = color.flamingo, bg = "NONE" },
  CmpItemKindFolder = { fg = color.flamingo, bg = "NONE" },

  CmpItemKindMethod = { fg = color.peach, bg = "NONE" },
  CmpItemKindValue = { fg = color.peach, bg = "NONE" },
  CmpItemKindEnumMember = { fg = color.peach, bg = "NONE" },

  CmpItemKindInterface = { fg = color.sky, bg = "NONE" },
  CmpItemKindColor = { fg = color.sky, bg = "NONE" },
  CmpItemKindTypeParameter = { fg = color.sky, bg = "NONE" },
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
