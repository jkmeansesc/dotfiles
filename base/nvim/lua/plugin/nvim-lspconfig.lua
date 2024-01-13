local M = {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "barreiroleo/ltex-extra.nvim",
    "smjonas/inc-rename.nvim", -- LSP renaming with immediate visual feedback
    "folke/neodev.nvim",
    "folke/neoconf.nvim",
    "b0o/schemastore.nvim",
  },
}

function M.config()
  local lspconfig = require "lspconfig"
  local icons = require "core.icons"
  local signs = {
    { name = "DiagnosticSignError", text = icons.DiagnosticError, texthl = "DiagnosticSignError" },
    { name = "DiagnosticSignWarn", text = icons.DiagnosticWarn, texthl = "DiagnosticSignWarn" },
    { name = "DiagnosticSignHint", text = icons.DiagnosticHint, texthl = "DiagnosticSignHint" },
    { name = "DiagnosticSignInfo", text = icons.DiagnosticInfo, texthl = "DiagnosticSignInfo" },
    { name = "DapStopped", text = icons.DapStopped, texthl = "DiagnosticWarn" },
    { name = "DapBreakpoint", text = icons.DapBreakpoint, texthl = "DiagnosticInfo" },
    { name = "DapBreakpointRejected", text = icons.DapBreakpointRejected, texthl = "DiagnosticError" },
    { name = "DapBreakpointCondition", text = icons.DapBreakpointCondition, texthl = "DiagnosticInfo" },
    { name = "DapLogPoint", text = icons.DapLogPoint, texthl = "DiagnosticInfo" },
  }
  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, sign)
  end

  vim.diagnostic.config {
    signs = {
      active = signs,
    },
    virtual_text = false,
    update_in_insert = false, -- reduce excessive notifications
    underline = true,
    severity_sort = true,
    float = {
      focusable = true,
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
    },
  }

  local servers = {
    "lua_ls",
    "yamlls",
    "html",
    "cssls",
    "emmet_ls",
    "pyright",
    "pyright",
    "jsonls",
    "ansiblels",
    "docker_compose_language_service",
    "dockerls",
    "lemminx",
    "clangd",
  }

  require("neoconf").setup()

  local on_attach = require("core.utils").on_attach
  local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

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
    lspconfig[server].setup(opts)
  end
end

return M
