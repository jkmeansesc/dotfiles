return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "zbirenbaum/copilot.lua",
  },
  config = function()
    require("avante").setup {
      provider = "copilot",
    }
  end,
}
