return {
  "mrjones2014/smart-splits.nvim",
  init = function() require("wen.core.utils").load_mappings "smartsplits" end,
  opts = {
    ignored_filetypes = { "nofile", "quickfix", "qf", "prompt" },
    ignored_buftypes = { "nofile" },
  },
}
