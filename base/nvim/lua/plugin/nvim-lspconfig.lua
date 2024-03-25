return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "smjonas/inc-rename.nvim", -- LSP renaming with immediate visual feedback
    "folke/neodev.nvim",
    "folke/neoconf.nvim",
    "b0o/schemastore.nvim",
  },
  config = function()
    require("neoconf").setup()

    local servers = {
      "lua_ls",
      "yamlls",
      "jsonls",
      "clangd",
      "marksman",
    }

    local on_attach = require("core.utils").on_attach
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

    for _, server in ipairs(servers) do
      local opts = {
        on_attach = on_attach,
        capabilities = capabilities,
      }
      local require_ok, settings = pcall(require, "plugin.lspsettings." .. server)
      if require_ok then opts = vim.tbl_deep_extend("force", settings, opts) end
      if server == "lua_ls" then
        require("neodev").setup {
          library = { plugins = { "nvim-dap-ui" }, types = true },
        }
      end
      if server == "clangd" then opts.capabilities = {
        offsetEncoding = { "utf-16" },
      } end
      require("lspconfig")[server].setup(opts)
    end
  end,
}
