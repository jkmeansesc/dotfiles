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
  -- ╭──────────────────────────────────────────────────────────╮
  -- │ tokyonight palette                                       │
  -- ╰──────────────────────────────────────────────────────────╯
  tokyonight = {
    bg = "#1a1b26",
    bg_dark = "#16161e",
    bg_float = "#16161e",
    bg_highlight = "#292e42",
    bg_popup = "#16161e",
    bg_search = "#3d59a1",
    bg_sidebar = "#16161e",
    bg_statusline = "#16161e",
    bg_visual = "#283457",
    black = "#15161e",
    blue = "#7aa2f7",
    blue0 = "#3d59a1",
    blue1 = "#2ac3de",
    blue2 = "#0db9d7",
    blue5 = "#89ddff",
    blue6 = "#b4f9f8",
    blue7 = "#394b70",
    border = "#15161e",
    border_highlight = "#27a1b9",
    comment = "#565f89",
    cyan = "#7dcfff",
    dark3 = "#545c7e",
    dark5 = "#737aa2",
    delta = {
      add = "#2c5a66",
      delete = "#713137",
    },
    diff = {
      add = "#20303b",
      change = "#1f2231",
      delete = "#37222c",
      text = "#394b70",
    },
    error = "#db4b4b",
    fg = "#c0caf5",
    fg_dark = "#a9b1d6",
    fg_float = "#c0caf5",
    fg_gutter = "#3b4261",
    fg_sidebar = "#a9b1d6",
    git = {
      add = "#449dab",
      change = "#6183bb",
      delete = "#914c54",
      ignore = "#545c7e",
    },
    gitSigns = {
      add = "#266d6a",
      change = "#536c9e",
      delete = "#b2555b",
    },
    green = "#9ece6a",
    green1 = "#73daca",
    green2 = "#41a6b5",
    hint = "#1abc9c",
    info = "#0db9d7",
    magenta = "#bb9af7",
    magenta2 = "#ff007c",
    none = "NONE",
    orange = "#ff9e64",
    purple = "#9d7cd8",
    red = "#f7768e",
    red1 = "#db4b4b",
    teal = "#1abc9c",
    terminal_black = "#414868",
    todo = "#7aa2f7",
    warning = "#e0af68",
    yellow = "#e0af68",
  },
}

local palette = M.palette

M.colors = {
  rosewater = palette.catppuccin.rosewater,
  flamingo = palette.catppuccin.flamingo,
  pink = palette.catppuccin.pink,
  mauve = palette.onedark.purple,
  red = palette.kanagawa.peachRed,
  maroon = palette.kanagawa.maroon,
  peach = palette.kanagawa.roninYellow,
  yellow = palette.onedark.yellow,
  green = palette.onedark.green,
  teal = palette.catppuccin.teal,
  sky = palette.catppuccin.sky,
  sapphire = palette.catppuccin.sapphire,
  blue = palette.onedark.blue,
  lavender = palette.gruvbox.fg,
  text = palette.catppuccin.text,
  subtext1 = palette.catppuccin.subtext1,
  subtext0 = palette.catppuccin.subtext0,
  overlay2 = palette.catppuccin.overlay2,
  overlay1 = palette.catppuccin.overlay1,
  overlay0 = palette.catppuccin.overlay0,
  surface2 = palette.catppuccin.surface2,
  surface1 = palette.catppuccin.surface1,
  surface0 = palette.catppuccin.surface0,
  base = palette.catppuccin.crust,
  mantle = palette.catppuccin.mantle,
  crust = palette.catppuccin.base,
  -- custom defined
  white = "#ffffff",
  innerbg = nil,
  outerbg = nil,
  crystalBlue = palette.kanagawa.crystalBlue,
  samuraiRed = palette.kanagawa.samuraiRed,
}

local color = M.colors

M.cmp = {
  CmpPmenu = { bg = color.base },
  CmpPmenuBorder = { fg = color.surface0, bg = color.base },
  CmpDoc = { bg = color.mantle },
  CmpDocBorder = { fg = color.surface0, bg = color.mantle },
  CmpSel = { fg = color.surface0, bg = color.green, bold = true },
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
  NvimTreeBoarder = { fg = color.surface0, bg = color.mantle },
  NvimTreeFolderName = { fg = color.crystalBlue },
  NvimTreeFolderIcon = { fg = color.crystalBlue },
  NvimTreeNormal = { fg = color.text, bg = color.mantle },
  NvimTreeNormalFloat = { link = "NvimTreeNormal" },
  NvimTreeOpenedFolderName = { fg = color.blue },
  NvimTreeEmptyFolderName = { fg = color.crystalBlue },
  NvimTreeIndentMarker = { fg = color.overlay0 },
  NvimTreeWinSeparator = { fg = color.surface1, bg = color.base },
  NvimTreeRootFolder = { fg = color.lavender, bold = true },
  NvimTreeSymlink = { fg = color.lavender },
  NvimTreeStatuslineNc = { fg = color.crust, bg = color.crust },
  NvimTreeGitDirty = { fg = color.yellow },
  NvimTreeGitNew = { fg = color.green },
  NvimTreeGitDeleted = { fg = color.red },
  NvimTreeSpecialFile = { fg = color.maroon },
  NvimTreeImageFile = { fg = color.text },
  NvimTreeOpenedFile = { fg = palette.white, bold = true },
}

M.harpoon = {
  HarpoonWindow = { fg = color.text, bg = color.mantle },
  HarpoonBorder = { fg = color.surface0, bg = color.mantle },
}

M.telescope = {
  TelescopeBorder = { fg = color.surface0, bg = color.mantle },
  TelescopeMatching = { fg = color.samuraiRed, bold = true },
  TelescopeNormal = { bg = color.mantle },
  TelescopePromptBorder = { fg = color.surface0, bg = color.mantle },
  TelescopePromptNormal = { fg = color.text, bg = color.mantle },
  TelescopePromptPrefix = { fg = color.red },
  TelescopePreviewTitle = { fg = color.base, bg = color.green },
  TelescopePromptTitle = { fg = color.base, bg = color.red },
  TelescopeResultsTitle = { fg = color.mantle, bg = color.mauve },
  TelescopeResultsLineNr = { fg = color.text, bg = color.green },
  TelescopeSelection = { fg = color.base, bg = color.green, bold = true },
  TelescopeSelectionCaret = { fg = color.base, bg = color.green, bold = true },
}

M.lsp = {
  LspBorder = { fg = color.surface0, bg = color.mantle },
  LspInfoBorder = { fg = color.mantle, bg = color.mantle },
}

return M
