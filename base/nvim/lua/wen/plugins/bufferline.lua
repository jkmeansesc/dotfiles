return {
  "akinsho/bufferline.nvim",
  event = "VeryLazy",
  init = function() require("wen.core.utils").load_mappings "bufferline" end,
  opts = {
    options = {
      close_command = function() require("wen.core.utils").close() end,
      right_mouse_command = function() require("wen.core.utils").close() end,
      diagnostics = "nvim_lsp",
      always_show_bufferline = false,
      separater_style = "thin",
      -- offsets = {
      --   {
      --     filetype = "neo-tree",
      --     highlight = "Directory",
      --   },
      -- },
    },
    highlights = {
      fill = {
        bg = {
          attribute = "fg",
          highlight = "000000",
        },
      },
    },
  },
}
