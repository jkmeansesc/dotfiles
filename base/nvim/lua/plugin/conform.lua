return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  keys = {
    {
      "<Leader>lf",
      function() require("conform").format { async = true, lsp_format = "fallback" } end,
      mode = "",
      desc = "[F]ormat buffer",
    },
  },
  config = function()
    require("conform").setup {
      formatters_by_ft = {
        lua = { "stylua" },
        -- Conform will run multiple formatters sequentially
        python = { "black" },
      },
      format_on_save = {
        timeout_ms = 500,
        lsp_format = "fallback",
      },
    }
  end,
}
