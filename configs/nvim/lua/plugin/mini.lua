return {
  "echasnovski/mini.nvim",
  event = { "BufReadPre", "BufNewFile" },
  keys = {
    {
      "<Leader>e",
      function()
        ---@diagnostic disable-next-line: undefined-global
        if not MiniFiles.close() then MiniFiles.open(vim.api.nvim_buf_get_name(0)) end
      end,
      desc = "[E]xplorer",
    },
  },
  config = function()
    require("mini.ai").setup()
    require("mini.surround").setup()
    require("mini.splitjoin").setup()
    require("mini.align").setup()

    require("mini.pairs").setup {
      mappings = {
        ["`"] = { action = "open", pair = "``", neigh_pattern = "[^\\].", register = { cr = false } },
      },
    }

    require("mini.files").setup {
      windows = {
        width_focus = 65,
        width_nofocus = 25,
      },
    }
  end,
}
