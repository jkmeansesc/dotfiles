return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "smjonas/inc-rename.nvim", -- LSP renaming with immediate visual feedback
    "b0o/schemastore.nvim",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    "saghen/blink.cmp",
  },
  keys = {
    { "<leader>hm", "<CMD>Mason<CR>", desc = "Mason" },
    { "<leader>hl", "<CMD>Lazy<CR>", desc = "Lazy" },
    { "<leader>hi", "<CMD>LspInfo<CR>", desc = "Lsp info" },
    {
      "<Leader>r",
      function() return ":IncRename " .. vim.fn.expand "<cword>" end,
      desc = "Inc-[R]ename",
      expr = true,
    },
  },
  config = function()
    -- ╭──────────────────────────────────────────────────────────╮
    -- │ setup dependencies                                       │
    -- ╰──────────────────────────────────────────────────────────╯

    require("mason").setup()

    require("inc_rename").setup()

    local servers = {
      "html", -- html
      "cssls", -- css
      "lua_ls", -- lua
      "yamlls", -- yaml
      "jsonls", -- json
      "markdown_oxide", -- markdown
      "taplo", -- toml
      "pyright", -- python
      "dockerls", -- Dockerfile
    }

    local formatters = {
      "stylua", -- lua formatter
      "prettier", -- prettier formatter
      "shfmt", -- shell formatter
      "black", -- python formatter
    }

    local linters = {
      "markdownlint", -- markdown linter
      "ruff", -- python linter
    }

    local ensure_installed = {}
    vim.list_extend(ensure_installed, servers)
    vim.list_extend(ensure_installed, formatters)
    vim.list_extend(ensure_installed, linters)

    require("mason-tool-installer").setup {
      ensure_installed = ensure_installed,
    }
    vim.cmd "MasonToolsInstall"

    -- ╭──────────────────────────────────────────────────────────╮
    -- │ setup diagnostic icons and more                          │
    -- ╰──────────────────────────────────────────────────────────╯

    local lsp = require("core.icons").lsp
    local border = require("core.utils").straight_boarder "LspBorder"

    local signs = {
      ERROR = lsp.DiagnosticError,
      WARN = lsp.DiagnosticWarn,
      INFO = lsp.DiagnosticInfo,
      HINT = lsp.DiagnosticHint,
    }
    local diagnostic_signs = {}
    for type, icon in pairs(signs) do
      diagnostic_signs[vim.diagnostic.severity[type]] = icon
    end

    vim.diagnostic.config {
      signs = {
        text = diagnostic_signs,
      },
      virtual_text = false,
      update_in_insert = false,
      underline = true,
      severity_sort = true,
      float = {
        focusable = true,
        border = border, ---@diagnostic disable-line
        source = true,
        header = "",
      },
    }

    -- Show line diagnostics automatically in hover window
    -- https://github.com/neovim/nvim-lspconfig/wiki/UI-Customization#show-line-diagnostics-automatically-in-hover-window
    vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
      group = vim.api.nvim_create_augroup("float_diagnostic", { clear = true }),
      callback = function() vim.diagnostic.open_float(nil, { focus = false }) end,
    })

    -- ╭──────────────────────────────────────────────────────────╮
    -- │ setup on_attach and capabilities                         │
    -- ╰──────────────────────────────────────────────────────────╯
    local on_attach = require("core.utils").on_attach
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = vim.tbl_deep_extend("force", capabilities, require("blink.cmp").get_lsp_capabilities())

    -- NOTE: for markdown_oxide
    capabilities.workspace = {
      didChangeWatchedFiles = {
        dynamicRegistration = true,
      },
    }

    -- ╭──────────────────────────────────────────────────────────╮
    -- │ setup each server                                        │
    -- ╰──────────────────────────────────────────────────────────╯

    for _, server in ipairs(servers) do
      local opts = {
        on_attach = on_attach,
        capabilities = capabilities,
      }
      local require_ok, settings = pcall(require, "lspsettings." .. server)
      if require_ok then opts = vim.tbl_deep_extend("force", settings, opts) end
      require("lspconfig")[server].setup(opts)
    end
  end,
}
