local M = {}

local c = require "core.colors"

M.mini = {
  MiniFilesTitleFocused = { fg = c.yellow, bold = true },
  MiniFilesCursorLine = { fg = c.mantle, bg = c.green, bold = true },
  MiniPickIconFile = {},
  MiniPickIconDirectory = {},
}

M.telescope = {
  TelescopeBorder = { fg = c.surface1 },
  TelescopeMatching = { fg = c.yellow },
  TelescopeNormal = { bg = c.mantle },
  TelescopePreviewNormal = { bg = c.crust },
  TelescopePreviewTitle = { fg = c.base, bg = c.blue },
  TelescopePreviewBorder = { fg = c.crust, bg = c.crust },
  TelescopePromptBorder = { fg = c.mantle, bg = c.mantle },
  TelescopePromptNormal = { fg = c.lavender, bg = c.mantle },
  TelescopePromptPrefix = { fg = c.red },
  TelescopePromptTitle = { fg = c.mantle, bg = c.red },
  TelescopeResultsNormal = { fg = c.lavender, bg = c.crust },
  TelescopeResultsBorder = { fg = c.crust, bg = c.crust },
  TelescopeResultsTitle = { fg = c.mantle, bg = c.green },
  TelescopeResultsLineNr = { fg = c.text, bg = c.green },
  TelescopeSelection = { fg = c.base, bg = c.green },
  TelescopeSelectionCaret = { fg = c.base, bg = c.green },
}

M.lsp = {
  LspBorder = { fg = c.crust, bg = c.crust },
  LspInfoBorder = { fg = c.crust, bg = c.crust },
}

M.render_markdown = {
  -- background
  RenderMarkdownH1Bg = { fg = c.red, bg = c.base, bold = true, italic = true },
  RenderMarkdownH2Bg = { fg = c.peach, bg = c.base, bold = true, italic = true },
  RenderMarkdownH3Bg = { fg = c.yellow, bg = c.base, bold = true, italic = true },
  RenderMarkdownH4Bg = { fg = c.green, bg = c.base, bold = true, italic = true },
  RenderMarkdownH5Bg = { fg = c.blue, bg = c.base, bold = true, italic = true },
  RenderMarkdownH6Bg = { fg = c.cyan, bg = c.base, bold = true, italic = true },
  RenderMarkdownCode = { bg = c.mantle },
  RenderMarkdownCodeInline = { bg = c.mantle },
}

M.blink = {
  BlinkCmpMenu = { fg = c.lavender, bg = c.crust },
  BlinkCmpMenuBorder = { fg = c.crust, bg = c.crust },
  BlinkCmpMenuSelection = { fg = c.mantle, bg = c.green },
  -- BlinkCmpScrollBarThumb = {fg = , bg = ,},
  -- BlinkCmpScrollBarGutter = {fg = , bg = ,},
  BlinkCmpLabel = { fg = c.lavender },
  -- BlinkCmpLabelDeprecated = {fg = , bg = ,},
  -- BlinkCmpLabelMatch = {fg = , bg = ,},
  -- BlinkCmpLabelDetail = {fg = , bg = ,},
  -- BlinkCmpLabelDescription = {fg = , bg = ,},
  -- BlinkCmpKind = {fg = , bg = ,},
  BlinkCmpSource = { fg = c.pink },
  -- BlinkCmpGhostText = {fg = , bg = ,},
  BlinkCmpDoc = { fg = c.lavender, bg = c.mantle },
  BlinkCmpDocBorder = { fg = c.surface1, bg = c.mantle },
  BlinkCmpDocSeparator = { fg = c.surface1, bg = c.mantle },
  -- BlinkCmpDocCursorLine = {fg = , bg = ,},
  BlinkCmpSignatureHelp = { fg = c.lavender, bg = c.mantle },
  BlinkCmpSignatureHelpBorder = { fg = c.mantle, bg = c.mantle },
  -- BlinkCmpSignatureHelpActiveParameter = {fg = , bg = ,},
}

M.snacks = {
  -- SnacksNormal = { fg = c.lavender, bg = c.crust }, -- Normal for the float window, default = NormalFloat
  -- SnacksWinBar = { bg = nil }, -- Title of the window, default = Title
  -- SnacksBackdrop = { bg = c.blue }, -- Backdrop, default = none
  -- SnacksNormalNC = { bg = nil }, -- Normal for non-current windows, default = NormalFloat
  -- SnacksWinBarNC = { fg = , bg = }, -- Title for non-current windows, default = SnacksWinBar
  SnacksScratchKey = { fg = c.lavender, bg = c.crust }, -- Keymap help in the footer, default = DiagnosticVirtualText
  SnacksScratchDesc = { fg = c.lavender, bg = c.crust }, -- Keymap help desc in the footer, default = DiagnosticInfo
  -- SnacksNotifierInfo = { fg = c.blue }, -- Notification window for Info, default = none
  -- SnacksNotifierWarn = { fg = c.yellow }, -- Notification window for Warn, default = none
  -- SnacksNotifierDebug = { fg = c.pink }, -- Notification window for Debug, default = none
  -- SnacksNotifierError = { fg = c.red }, -- Notification window for Error, default = none
  -- SnacksNotifierTrace = { fg = c.maroon }, -- Notification window for Trace, default = none
  SnacksNotifierIconInfo = { fg = c.blue }, -- Icon for Info notification, default = none
  SnacksNotifierIconWarn = { fg = c.yellow }, -- Icon for Warn notification, default = none
  SnacksNotifierIconDebug = { fg = c.pink }, -- Icon for Debug notification, default = none
  SnacksNotifierIconError = { fg = c.red }, -- Icon for Error notification, default = none
  SnacksNotifierIconTrace = { fg = c.maroon }, -- Icon for Trace notification, default = none
  SnacksNotifierTitleInfo = { fg = c.blue }, -- Title for Info notification, default = none
  SnacksNotifierTitleWarn = { fg = c.yellow }, -- Title for Warn notification, default = none
  SnacksNotifierTitleDebug = { fg = c.pink }, -- Title for Debug notification, default = none
  SnacksNotifierTitleError = { fg = c.red }, -- Title for Error notification, default = none
  SnacksNotifierTitleTrace = { fg = c.maroon }, -- Title for Trace notification, default = none
  SnacksNotifierBorderInfo = { fg = c.blue }, -- Border for Info notification, default = none
  SnacksNotifierBorderWarn = { fg = c.yellow }, -- Border for Warn notification, default = none
  SnacksNotifierBorderDebug = { fg = c.pink }, -- Border for Debug notification, default = none
  SnacksNotifierBorderError = { fg = c.red }, -- Border for Error notification, default = none
  SnacksNotifierBorderTrace = { fg = c.maroon }, -- Border for Trace notification, default = none
  -- SnacksNotifierFooterInfo = { bg = nil }, -- Footer for Info notification, default = DiagnosticInfo
  -- SnacksNotifierFooterWarn = { bg = nil }, -- Footer for Warn notification, default = DiagnosticWarn
  -- SnacksNotifierFooterDebug = { bg = nil }, -- Footer for Debug notification, default = DiagnosticHint
  -- SnacksNotifierFooterError = { bg = nil }, -- Footer for Error notification, default = DiagnosticError
  -- SnacksNotifierFooterTrace = { bg = nil }, -- Footer for Trace notification, default = DiagnosticHint
  -- SnacksDashboardNormal = { fg = , bg = }, -- Normal for the dashboard, default = Normal
  -- SnacksDashboardDesc = { fg = , bg = }, -- Description text in dashboard, default = Special
  -- SnacksDashboardFile = { fg = , bg = }, -- Dashboard file items, default = Special
  -- SnacksDashboardDir = { fg = , bg = }, -- Directory items, default = NonText
  -- SnacksDashboardFooter = { fg = , bg = }, -- Dashboard footer text, default = Title
  SnacksDashboardHeader = { fg = c.blue }, -- Dashboard header text, default = Title
  -- SnacksDashboardIcon = { fg = , bg = }, -- Dashboard icons, default = Special
  -- SnacksDashboardKey = { fg = , bg = }, -- Keybind text, default = Number
  -- SnacksDashboardTerminal = { fg = , bg = }, -- Terminal text, default = SnacksDashboardNormal
  -- SnacksDashboardSpecial = { fg = , bg = }, -- Special elements, default = Special
  -- SnacksDashboardTitle = { fg = , bg = }, -- Title text, default = Title
  SnacksInputNormal = { fg = c.lavender, bg = c.mantle },
  SnacksInputIcon = { fg = c.red },
  SnacksInputTitle = { fg = c.lavender, bg = c.mantle },
  SnacksInputBorder = { fg = c.red, bg = c.mantle },
  SnacksInputPrompt = { fg = c.lavender, bg = c.mantle },
}

for _, definitions in pairs(M) do
  for highlight_name, highlight_attrs in pairs(definitions) do
    vim.api.nvim_set_hl(0, highlight_name, highlight_attrs)
  end
end

-- M.alpha = {
--   AlphaLogoBlue = { fg = c.blue },
--   AlphaLogoGreenFBlueB = { fg = c.green, bg = c.blue },
--   AlphaLogoGreen = { fg = c.green },
--   AlphaHeader = { fg = c.blue },
--   AlphaButtons = { fg = c.red },
--   AlphaFooter = { fg = c.peach },
--   AlphaShortcut = { fg = c.yellow },
-- }

-- M.nvimtree = {
--   NvimTreeBoarder = { fg = c.crust, bg = c.crust },
--   NvimTreeFolderName = { fg = c.blue },
--   NvimTreeFolderIcon = { fg = c.blue },
--   NvimTreeNormal = { fg = c.text, bg = c.crust },
--   NvimTreeNormalFloat = { link = "NvimTreeNormal" },
--   NvimTreeOpenedFolderName = { fg = c.blue },
--   NvimTreeEmptyFolderName = { fg = c.blue },
--   NvimTreeIndentMarker = { fg = c.overlay0 },
--   NvimTreeWinSeparator = { fg = c.surface1, bg = c.base },
--   NvimTreeRootFolder = { fg = c.lavender, bold = true },
--   NvimTreeSymlink = { fg = c.lavender },
--   NvimTreeStatuslineNc = { fg = c.crust, bg = c.crust },
--   NvimTreeGitDirty = { fg = c.yellow },
--   NvimTreeGitNew = { fg = c.overlay0 },
--   NvimTreeGitDeleted = { fg = c.red },
--   NvimTreeSpecialFile = { fg = c.maroon },
--   NvimTreeImageFile = { fg = c.pink },
--   NvimTreeOpenedFile = { fg = c.rosewater, bold = true },
--   NvimTreeCursorLine = { fg = c.mantle, bg = c.green },
--   NvimTreeGitStaged = { fg = c.green },
-- }

return M
