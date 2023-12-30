return {
  {
    "mfussenegger/nvim-dap",
    enabled = vim.fn.has "win32" == 0,
    dependencies = {
      { "rcarriga/nvim-dap-ui", config = require "configs.nvim-dap-ui" },
      {
        "rcarriga/cmp-dap",
        dependencies = { "nvim-cmp" },
        config = require "configs.cmp-dap",
      },
      { "theHamsta/nvim-dap-virtual-text", config = true },
    },
    event = { "BufReadPre", "BufNewFile" },
    config = require "configs.nvim-dap",
  },
}
