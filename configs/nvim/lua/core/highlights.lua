local M = {}

local c = require "core.colors"

M.alpha = {
  AlphaLogoBlue = { fg = c.blue },
  AlphaLogoGreenFBlueB = { fg = c.green, bg = c.blue },
  AlphaLogoGreen = { fg = c.green },
  AlphaHeader = { fg = c.blue },
  AlphaButtons = { fg = c.red },
  AlphaFooter = { fg = c.peach },
  AlphaShortcut = { fg = c.yellow },
}

M.nvimtree = {
  NvimTreeBoarder = { fg = c.crust, bg = c.crust },
  NvimTreeFolderName = { fg = c.blue },
  NvimTreeFolderIcon = { fg = c.blue },
  NvimTreeNormal = { fg = c.text, bg = c.crust },
  NvimTreeNormalFloat = { link = "NvimTreeNormal" },
  NvimTreeOpenedFolderName = { fg = c.blue },
  NvimTreeEmptyFolderName = { fg = c.blue },
  NvimTreeIndentMarker = { fg = c.overlay0 },
  NvimTreeWinSeparator = { fg = c.surface1, bg = c.base },
  NvimTreeRootFolder = { fg = c.lavender, bold = true },
  NvimTreeSymlink = { fg = c.lavender },
  NvimTreeStatuslineNc = { fg = c.crust, bg = c.crust },
  NvimTreeGitDirty = { fg = c.yellow },
  NvimTreeGitNew = { fg = c.overlay0 },
  NvimTreeGitDeleted = { fg = c.red },
  NvimTreeSpecialFile = { fg = c.maroon },
  NvimTreeImageFile = { fg = c.pink },
  NvimTreeOpenedFile = { fg = c.rosewater, bold = true },
  NvimTreeCursorLine = { fg = c.mantle, bg = c.green },
  NvimTreeGitStaged = { fg = c.green },
}

M.harpoon = {}

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

for _, definitions in pairs(M) do
  for highlight_name, highlight_attrs in pairs(definitions) do
    vim.api.nvim_set_hl(0, highlight_name, highlight_attrs)
  end
end

return M
