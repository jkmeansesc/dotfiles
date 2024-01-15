local M = {
  "famiu/bufdelete.nvim",
  cmd = { "Bdelete", "Bwipeout" },
  init = function() require("core.utils").load_mappings "bufdelete" end,
}
return M
