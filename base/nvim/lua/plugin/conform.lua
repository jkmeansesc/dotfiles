return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  cmd = { "ConformInfo" },
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
        python = { "black" },
        markdown = { "markdownlint-cli2" },
        svelte = { "prettier" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        vue = { "prettier" },
        css = { "prettier" },
        scss = { "prettier" },
        less = { "prettier" },
        html = { "prettier" },
        json = { "prettier" },
        jsonc = { "prettier" },
        yaml = { "prettier" },
        graphql = { "prettier" },
        handlebars = { "prettier" },
        sh = { "shfmt" },
        bash = { "shfmt" },
        toml = { "taplo" },
      },
      format_on_save = {
        timeout_ms = 500,
        lsp_format = "fallback",
      },
    }

    require("conform").formatters.shfmt = { prepend_args = { "-i", "2" } }
  end,
}
