local M = {
  "mrjones2014/smart-splits.nvim",
  init = function() require("core.utils").load_mappings "smartsplits" end,
}

M.opts = {
  ignored_filetypes = { "nofile", "quickfix", "qf", "prompt" },
  ignored_buftypes = { "nofile" },
}

return M
