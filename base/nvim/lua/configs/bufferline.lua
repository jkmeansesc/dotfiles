return {
  options = {
    close_command = function() require("core.utils").close() end,
    right_mouse_command = function() require("core.utils").close() end,
    diagnostics = "nvim_lsp",
    always_show_bufferline = true,
    separater_style = "thin",
    offsets = {
      {
        filetype = "neo-tree",
        highlight = "Directory",
        text = "File Explorer",
        text_align = "center",
      },
    },
  },
  highlights = {
    fill = {
      bg = {
        attribute = "fg",
        highlight = "000000",
      },
    },
  },
}
