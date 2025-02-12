return {
  "echasnovski/mini.nvim",
  event = { "BufReadPre", "BufNewFile" },
  keys = {
    {
      "<Leader>e",
      function()
        ---@diagnostic disable-next-line: undefined-global
        if not MiniFiles.close() then MiniFiles.open() end
      end,
      desc = "[E]xplorer",
    },
  },
  config = function()
    require("mini.ai").setup()
    require("mini.surround").setup()
    require("mini.splitjoin").setup()
    require("mini.files").setup {
      windows = {
        width_focus = 65,
        width_nofocus = 25,
      },
    }
  end,
}
