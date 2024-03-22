-- vim.cmd [[colorscheme rose-pine]]
return {
  "rose-pine/neovim",
  enabled = false,
  name = "rose-pine",
  lazy = false,
  priority = 1000,
  opts = {
    styles = {
      bold = true,
      italic = true,
      transparency = false,
    },
    highlight_groups = {
      Comment = { fg = "foam" },
      VertSplit = { fg = "muted", bg = "muted" },
    },
    before_highlight = function(group, highlight, palette)
      -- Disable all undercurls
      if highlight.undercurl then highlight.undercurl = false end

      -- Change palette colour
      if highlight.fg == palette.pine then highlight.fg = palette.foam end
    end,
  },
}
