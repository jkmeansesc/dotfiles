return {
  "smjonas/inc-rename.nvim", -- LSP renaming with immediate visual feedback
  init = function() require("wen.core.utils").load_mappings "increname" end,
  config = true,
}
