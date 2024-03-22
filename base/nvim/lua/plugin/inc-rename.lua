return {
  "smjonas/inc-rename.nvim",
  keys = {
    {
      "<Leader>r",
      function() return ":IncRename " .. vim.fn.expand "<cword>" end,
      desc = "Inc-rename",
      expr = true,
    },
  },
}
