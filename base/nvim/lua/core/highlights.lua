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
  CmpPmenuBorder = { fg = color.pink, bg = color.crust },
  CmpDocBorder = { fg = color.pink, bg = color.mantle },
  CmpSel = { fg = color.surface0, bg = color.green, bold = true },
  CmpPmenu = { bg = color.crust },
  CmpDoc = { bg = color.mantle },

  CmpItemKindCopilot = { fg = color.green },

  CmpItemAbbrDeprecated = { fg = color.surface0, strikethrough = true },
  CmpItemAbbrMatch = { fg = color.blue, bold = true },
  CmpItemAbbrMatchFuzzy = { fg = color.blue, bold = true },
  CmpItemMenu = { fg = color.mauve },

  CmpItemKindField = { fg = color.rosewater },
  CmpItemKindProperty = { fg = color.rosewater },
  CmpItemKindEvent = { fg = color.rosewater },

  CmpItemKindText = { fg = color.text },
  CmpItemKindEnum = { fg = color.text },
  CmpItemKindKeyword = { fg = color.text },

  CmpItemKindConstant = { fg = color.yellow },
  CmpItemKindConstructor = { fg = color.yellow },
  CmpItemKindReference = { fg = color.yellow },

  CmpItemKindFunction = { fg = color.mauve },
  CmpItemKindStruct = { fg = color.mauve },
  CmpItemKindClass = { fg = color.mauve },
  CmpItemKindModule = { fg = color.mauve },
  CmpItemKindOperator = { fg = color.mauve },

  CmpItemKindVariable = { fg = color.subtext0 },
  CmpItemKindFile = { fg = color.subtext0 },

  CmpItemKindUnit = { fg = color.flamingo },
  CmpItemKindSnippet = { fg = color.flamingo },
  CmpItemKindFolder = { fg = color.flamingo },

  CmpItemKindMethod = { fg = color.peach },
  CmpItemKindValue = { fg = color.peach },
  CmpItemKindEnumMember = { fg = color.peach },

  CmpItemKindInterface = { fg = color.sky },
  CmpItemKindColor = { fg = color.sky },
  CmpItemKindTypeParameter = { fg = color.sky },
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

M.nvimtree = {
  NvimTreeBoarder = { fg = color.pink, bg = color.crust },
  NvimTreeFolderName = { fg = color.flamingo },
  NvimTreeFolderIcon = { fg = color.flamingo },
  NvimTreeNormal = { fg = color.text, bg = color.crust },
  NvimTreeNormalFloat = { fg = color.text, bg = color.crust },
  NvimTreeOpenedFolderName = { fg = color.blue },
  NvimTreeEmptyFolderName = { fg = color.blue },
  NvimTreeIndentMarker = { fg = color.overlay0 },
  NvimTreeWinSeparator = { fg = color.surface1, bg = color.base },
  NvimTreeRootFolder = { fg = color.lavender, bold = true },
  NvimTreeSymlink = { fg = color.pink },
  NvimTreeStatuslineNc = { fg = color.crust, bg = color.crust },
  NvimTreeGitDirty = { fg = color.yellow },
  NvimTreeGitNew = { fg = color.blue },
  NvimTreeGitDeleted = { fg = color.red },
  NvimTreeSpecialFile = { fg = color.flamingo },
  NvimTreeImageFile = { fg = color.text },
  NvimTreeOpenedFile = { fg = color.pink },
}

M.harpoon = {
  HarpoonWindow = { fg = color.text, bg = color.mantle },
  HarpoonBorder = { fg = color.pink, bg = color.mantle },
}

M.telescope = {}

return M
