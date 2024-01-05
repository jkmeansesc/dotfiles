local M = {
  "smjonas/inc-rename.nvim", -- LSP renaming with immediate visual feedback
  init = function() require("core.utils").load_mappings "increname" end,
  config = true,
}
return M
