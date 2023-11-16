return {
  "akinsho/bufferline.nvim",
  event = "VeryLazy",
  opts = {
    options = {
      close_command = function() require("core.utils").close() end,
      right_mouse_command = function() require("core.utils").close() end,
      diagnostics = "nvim_lsp",
      always_show_bufferline = true,
      separater_style = "slant",
      -- offsets = {
      --   {
      --     filetype = "neo-tree",
      --     highlight = "Directory",
      --   },
      -- },
    },
  },
}
