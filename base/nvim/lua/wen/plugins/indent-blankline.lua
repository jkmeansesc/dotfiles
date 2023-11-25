return {
  "lukas-reineke/indent-blankline.nvim",
  version = "2.20.7",
  event = { "BufReadPre", "BufNewFile" },
  init = function() require("wen.core.utils").load_mappings "blankline" end,
  opts = {
    indentLine_enabled = 1,

    indent = {
      char = "│",
      tab_char = "│",
    },
    scope = { enabled = false },
    exclude = {
      buftypes = { "nofile", "terminal" },
      filetypes = {
        "help",
        "alpha",
        "dashboard",
        "neo-tree",
        "Trouble",
        "trouble",
        "lazy",
        "mason",
        "notify",
        "toggleterm",
        "lazyterm",
      },
    },
    show_trailing_blankline_indent = false,
    show_first_indent_level = false,
    show_current_context = true,
    show_current_context_start = true,
  },
}
