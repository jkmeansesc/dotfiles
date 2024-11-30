local M = {}

local p = require "core.palette"
local c = p.catppuccin

M.cmp = {
  CmpPmenu = { bg = c.base },
  CmpPmenuBorder = { fg = c.surface0, bg = c.base },
  CmpDoc = { bg = c.mantle },
  CmpDocBorder = { fg = c.surface0, bg = c.mantle },
  CmpSel = { fg = c.surface0, bg = c.green, bold = true },
  CmpItemKindCopilot = { fg = c.green },

  CmpItemAbbrDeprecated = { fg = c.surface0, strikethrough = true },
  CmpItemAbbrMatch = { fg = c.blue, bold = true },
  CmpItemAbbrMatchFuzzy = { fg = c.blue, bold = true },
  CmpItemMenu = { fg = c.mauve },

  CmpItemKindField = { fg = c.rosewater },
  CmpItemKindProperty = { fg = c.rosewater },
  CmpItemKindEvent = { fg = c.rosewater },

  CmpItemKindText = { fg = c.text },
  CmpItemKindEnum = { fg = c.text },
  CmpItemKindKeyword = { fg = c.text },

  CmpItemKindConstant = { fg = c.yellow },
  CmpItemKindConstructor = { fg = c.yellow },
  CmpItemKindReference = { fg = c.yellow },

  CmpItemKindFunction = { fg = c.mauve },
  CmpItemKindStruct = { fg = c.mauve },
  CmpItemKindClass = { fg = c.mauve },
  CmpItemKindModule = { fg = c.mauve },
  CmpItemKindOperator = { fg = c.mauve },

  CmpItemKindVariable = { fg = c.subtext0 },
  CmpItemKindFile = { fg = c.subtext0 },

  CmpItemKindUnit = { fg = c.flamingo },
  CmpItemKindSnippet = { fg = c.flamingo },
  CmpItemKindFolder = { fg = c.flamingo },

  CmpItemKindMethod = { fg = c.peach },
  CmpItemKindValue = { fg = c.peach },
  CmpItemKindEnumMember = { fg = c.peach },

  CmpItemKindInterface = { fg = c.sky },
  CmpItemKindColor = { fg = c.sky },
  CmpItemKindTypeParameter = { fg = c.sky },
}

M.alpha = {
  AlphaLogoBlue = { fg = c.blue },
  AlphaLogoGreenFBlueB = { fg = c.green, bg = c.blue },
  AlphaLogoGreen = { fg = c.green },
  AlphaHeader = { fg = c.yellow },
  AlphaButtons = { fg = c.lavender },
  AlphaFooter = { fg = c.peach },
  AlphaShortcut = { fg = c.green },
}

M.nvimtree = {
  NvimTreeBoarder = { fg = c.surface0, bg = c.mantle },
  NvimTreeFolderName = { fg = c.blue },
  NvimTreeFolderIcon = { fg = c.blue },
  NvimTreeNormal = { fg = c.text, bg = c.mantle },
  NvimTreeNormalFloat = { link = "NvimTreeNormal" },
  NvimTreeOpenedFolderName = { fg = c.blue },
  NvimTreeEmptyFolderName = { fg = c.blue },
  NvimTreeIndentMarker = { fg = c.overlay0 },
  NvimTreeWinSeparator = { fg = c.surface1, bg = c.base },
  NvimTreeRootFolder = { fg = c.lavender, bold = true },
  NvimTreeSymlink = { fg = c.lavender },
  NvimTreeStatuslineNc = { fg = c.crust, bg = c.crust },
  NvimTreeGitDirty = { fg = c.yellow },
  NvimTreeGitNew = { fg = c.green },
  NvimTreeGitDeleted = { fg = c.red },
  NvimTreeSpecialFile = { fg = c.maroon },
  NvimTreeImageFile = { fg = c.text },
  NvimTreeOpenedFile = { fg = p.white, bold = true },
}

M.harpoon = {
  HarpoonWindow = { fg = c.text, bg = c.mantle },
  HarpoonBorder = { fg = c.surface0, bg = c.mantle },
}

M.telescope = {
  TelescopeBorder = { fg = c.surface0, bg = c.mantle },
  TelescopeMatching = { fg = c.red, bold = true },
  TelescopeNormal = { bg = c.mantle },
  TelescopePromptBorder = { fg = c.surface0, bg = c.mantle },
  TelescopePromptNormal = { fg = c.text, bg = c.mantle },
  TelescopePromptPrefix = { fg = c.red },
  TelescopePromptTitle = { fg = c.base, bg = c.red },
  TelescopePreviewTitle = { fg = c.base, bg = c.green },
  TelescopePreviewBorder = { fg = c.surface0, bg = c.mantle },
  TelescopeResultsBorder = { fg = c.surface0, bg = c.mantle },
  TelescopeResultsTitle = { fg = c.mantle, bg = c.mauve },
  TelescopeResultsLineNr = { fg = c.text, bg = c.green },
  TelescopeSelection = { fg = c.base, bg = c.green, bold = true },
  TelescopeSelectionCaret = { fg = c.base, bg = c.green, bold = true },
}

M.lsp = {
  LspBorder = { fg = c.surface0, bg = c.mantle },
  LspInfoBorder = { fg = c.mantle, bg = c.mantle },
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

return M
