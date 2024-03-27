local M = {}

M.palette = {
  -- ╭──────────────────────────────────────────────────────────╮
  -- │ catppuccin palette                                       │
  -- ╰──────────────────────────────────────────────────────────╯
  catppuccin = {
    rosewater = "#F5E0DC",
    flamingo = "#F2CDCD",
    pink = "#F5C2E7",
    mauve = "#CBA6F7",
    red = "#F38BA8",
    maroon = "#EBA0AC",
    peach = "#FAB387",
    yellow = "#F9E2AF",
    green = "#A6E3A1",
    teal = "#94E2D5",
    sky = "#89DCEB",
    sapphire = "#74C7EC",
    blue = "#89B4FA",
    lavender = "#B4BEFE",
    text = "#CDD6F4",
    subtext1 = "#BAC2DE",
    subtext0 = "#A6ADC8",
    overlay2 = "#9399B2",
    overlay1 = "#7F849C",
    overlay0 = "#6C7086",
    surface2 = "#585B70",
    surface1 = "#45475A",
    surface0 = "#313244",
    base = "#1E1E2E",
    mantle = "#181825",
    crust = "#11111B",
  },
  -- ╭──────────────────────────────────────────────────────────╮
  -- │ onedark palette                                          │
  -- ╰──────────────────────────────────────────────────────────╯
  onedark = {
    black = "#282C34",
    red = "#E06C75",
    green = "#98C379",
    yellow = "#E5C07B",
    blue = "#61AFEF",
    purple = "#C678DD",
    cyan = "#56B6C2",
    gray = "#ABB2BF",
  },
  -- ╭──────────────────────────────────────────────────────────╮
  -- │ kanagawa palette                                         │
  -- ╰──────────────────────────────────────────────────────────╯
  kanagawa = {
    fujiWhite = "#DCD7BA", -- Default foreground
    oldWhite = "#C8C093", -- Dark foreground (statuslines)
    sumiInk0 = "#16161D", -- Dark background (statuslines and floating windows)
    sumiInk1 = "#1F1F28", -- Default background
    sumiInk2 = "#2A2A37", -- Lighter background (colorcolumn, folds)
    sumiInk3 = "#363646", -- Lighter background (cursorline)
    sumiInk4 = "#54546D", -- Darker foreground (line numbers, fold column, non-text characters), float borders
    waveBlue1 = "#223249", -- Popup background, visual selection background
    waveBlue2 = "#2D4F67", -- Popup selection background, search background
    winterGreen = "#2B3328", -- Diff Add (background)
    winterYellow = "#49443C", -- Diff Change (background)
    winterRed = "#43242B", -- Diff Deleted (background)
    winterBlue = "#252535", -- Diff Line (background)
    autumnGreen = "#76946A", -- Git Add
    autumnRed = "#C34043", -- Git Delete
    autumnYellow = "#DCA561", -- Git Change
    samuraiRed = "#E82424", -- Diagnostic Error
    roninYellow = "#FF9E3B", -- Diagnostic Warning
    waveAqua1 = "#6A9589", -- Diagnostic Info
    dragonBlue = "#658594", -- Diagnostic Hint
    fujiGray = "#727169", -- Comments
    springViolet1 = "#938AA9", -- Light foreground
    oniViolet = "#957FB8", -- Statements and Keywords
    crystalBlue = "#7E9CD8", -- Functions and Titles
    springViolet2 = "#9CABCA", -- Brackets and punctuation
    springBlue = "#7FB4CA", -- Specials and builtin functions
    lightBlue = "#A3D4D5", -- Not used
    waveAqua2 = "#7AA89F", -- Types
    springGreen = "#98BB6C", -- Strings
    boatYellow1 = "#938056", -- Not used
    boatYellow2 = "#C0A36E", -- Operators, RegEx
    carpYellow = "#E6C384", -- Identifiers
    sakuraPink = "#D27E99", -- Numbers
    waveRed = "#E46876", -- Standout specials 1 (builtin variables)
    peachRed = "#FF5D62", -- Standout specials 2 (exception handling, return)
    surimiOrange = "#FFA066", -- Constants, imports, booleans
    katanaGray = "#717C7C", -- Deprecated
  },
  -- ╭──────────────────────────────────────────────────────────╮
  -- │ gruvbox palette                                          │
  -- ╰──────────────────────────────────────────────────────────╯
  gruvbox = {
    bg = "#282828",
    bg0_s = "#32302f",
    bg0_h = "#1d2021",
    bg0 = "#282828",
    bg1 = "#3c3836",
    bg2 = "#504945",
    bg3 = "#665c54",
    bg4 = "#7c6f64",
    fg = "#ebdbb2",
    fg0 = "#fbf1c7",
    fg1 = "#ebdbb2",
    fg2 = "#d5c4a1",
    fg3 = "#bdae93",
    fg4 = "#a89984",
    red = "#cc241d",
    green = "#98971a",
    yellow = "#d79921",
    blue = "#458588",
    purple = "#b16286",
    aqua = "#689d6a",
    orange = "#d65d0e",
    gray = "#a89984",
    silver = "#928374",
  },
  white = "#ffffff",
  innerbg = nil,
  outerbg = nil,
}

local palette = M.palette
local catppuccin = palette.catppuccin
local onedark = palette.onedark
local kanagawa = palette.kanagawa
local gruvbox = palette.gruvbox

M.cmp = {
  CmpPmenu = { bg = catppuccin.base },
  CmpPmenuBorder = { fg = catppuccin.surface0, bg = catppuccin.base },
  CmpDoc = { bg = catppuccin.mantle },
  CmpDocBorder = { fg = catppuccin.surface0, bg = catppuccin.mantle },
  CmpSel = { fg = catppuccin.surface0, bg = catppuccin.green, bold = true },
  CmpItemKindCopilot = { fg = catppuccin.green },

  CmpItemAbbrDeprecated = { fg = catppuccin.surface0, strikethrough = true },
  CmpItemAbbrMatch = { fg = catppuccin.blue, bold = true },
  CmpItemAbbrMatchFuzzy = { fg = catppuccin.blue, bold = true },
  CmpItemMenu = { fg = catppuccin.mauve },

  CmpItemKindField = { fg = catppuccin.rosewater },
  CmpItemKindProperty = { fg = catppuccin.rosewater },
  CmpItemKindEvent = { fg = catppuccin.rosewater },

  CmpItemKindText = { fg = catppuccin.text },
  CmpItemKindEnum = { fg = catppuccin.text },
  CmpItemKindKeyword = { fg = catppuccin.text },

  CmpItemKindConstant = { fg = catppuccin.yellow },
  CmpItemKindConstructor = { fg = catppuccin.yellow },
  CmpItemKindReference = { fg = catppuccin.yellow },

  CmpItemKindFunction = { fg = catppuccin.mauve },
  CmpItemKindStruct = { fg = catppuccin.mauve },
  CmpItemKindClass = { fg = catppuccin.mauve },
  CmpItemKindModule = { fg = catppuccin.mauve },
  CmpItemKindOperator = { fg = catppuccin.mauve },

  CmpItemKindVariable = { fg = catppuccin.subtext0 },
  CmpItemKindFile = { fg = catppuccin.subtext0 },

  CmpItemKindUnit = { fg = catppuccin.flamingo },
  CmpItemKindSnippet = { fg = catppuccin.flamingo },
  CmpItemKindFolder = { fg = catppuccin.flamingo },

  CmpItemKindMethod = { fg = catppuccin.peach },
  CmpItemKindValue = { fg = catppuccin.peach },
  CmpItemKindEnumMember = { fg = catppuccin.peach },

  CmpItemKindInterface = { fg = catppuccin.sky },
  CmpItemKindColor = { fg = catppuccin.sky },
  CmpItemKindTypeParameter = { fg = catppuccin.sky },
}

M.alpha = {
  AlphaLogoBlue = { fg = catppuccin.blue },
  AlphaLogoGreenFBlueB = { fg = catppuccin.green, bg = catppuccin.blue },
  AlphaLogoGreen = { fg = catppuccin.green },
  AlphaHeader = { fg = catppuccin.yellow },
  AlphaButtons = { fg = catppuccin.lavender },
  AlphaFooter = { fg = catppuccin.peach },
  AlphaShortcut = { fg = catppuccin.green },
}

M.nvimtree = {
  NvimTreeBoarder = { fg = catppuccin.red, bg = catppuccin.mantle },
  NvimTreeFolderName = { fg = kanagawa.crystalBlue },
  NvimTreeFolderIcon = { fg = kanagawa.crystalBlue },
  NvimTreeNormal = { fg = catppuccin.text, bg = catppuccin.mantle },
  NvimTreeNormalFloat = { link = "NvimTreeNormal" },
  NvimTreeOpenedFolderName = { fg = onedark.blue },
  NvimTreeEmptyFolderName = { fg = kanagawa.crystalBlue },
  NvimTreeIndentMarker = { fg = catppuccin.overlay0 },
  NvimTreeWinSeparator = { fg = catppuccin.surface1, bg = catppuccin.base },
  NvimTreeRootFolder = { fg = catppuccin.lavender, bold = true },
  NvimTreeSymlink = { fg = catppuccin.lavender },
  NvimTreeStatuslineNc = { fg = catppuccin.crust, bg = catppuccin.crust },
  NvimTreeGitDirty = { fg = catppuccin.yellow },
  NvimTreeGitNew = { fg = catppuccin.blue },
  NvimTreeGitDeleted = { fg = catppuccin.red },
  NvimTreeSpecialFile = { fg = catppuccin.flamingo },
  NvimTreeImageFile = { fg = catppuccin.text },
  NvimTreeOpenedFile = { fg = palette.white, bold = true },
}

M.harpoon = {
  HarpoonWindow = { fg = catppuccin.text, bg = catppuccin.mantle },
  HarpoonBorder = { fg = catppuccin.red, bg = catppuccin.mantle },
}

M.telescope = {
  TelescopeBorder = { fg = catppuccin.surface0, bg = catppuccin.mantle },
  TelescopeMatching = { fg = catppuccin.red, bold = true },
  TelescopeNormal = { bg = catppuccin.mantle },
  TelescopePromptBorder = { fg = catppuccin.surface0, bg = catppuccin.base },
  TelescopePromptNormal = { fg = catppuccin.text, bg = catppuccin.base },
  TelescopePromptPrefix = { fg = catppuccin.flamingo, bg = catppuccin.base },
  TelescopePreviewTitle = { fg = catppuccin.base, bg = catppuccin.green },
  TelescopePromptTitle = { fg = catppuccin.base, bg = catppuccin.red },
  TelescopeResultsTitle = { fg = catppuccin.mantle, bg = catppuccin.lavender },
  TelescopeSelection = { fg = catppuccin.base, bg = catppuccin.green, bold = true },
  TelescopeSelectionCaret = { fg = catppuccin.base, bg = catppuccin.green, bold = true },
}

M.lsp = {
  LspBorder = { fg = catppuccin.surface0, bg = catppuccin.mantle },
  LspInfoBorder = { fg = catppuccin.mantle, bg = catppuccin.mantle },
}

return M
