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
    -- ╭──────────────────────────────────────────────────────────╮
    -- │ setup dependencies                                       │
    -- ╰──────────────────────────────────────────────────────────╯
    require("neoconf").setup()

    -- ╭──────────────────────────────────────────────────────────╮
    -- │ setup diagnostic icons and highlight and more            │
    -- ╰──────────────────────────────────────────────────────────╯
    require("core.utils").setPluginHighlights "lsp"

    local icons_lsp = require("core.icons").lsp
    local border = require("core.utils").box_boarder "LspBorder"
    local diagnostic_hl = {
      [vim.diagnostic.severity.INFO] = "DiagnosticInfo",
      [vim.diagnostic.severity.HINT] = "DiagnosticHint",
      [vim.diagnostic.severity.WARN] = "DiagnosticWarn",
      [vim.diagnostic.severity.ERROR] = "DiagnosticError",
    }

    vim.diagnostic.config {
      signs = {
        text = {
          [vim.diagnostic.severity.INFO] = icons_lsp.DiagnosticInfo,
          [vim.diagnostic.severity.HINT] = icons_lsp.DiagnosticHint,
          [vim.diagnostic.severity.WARN] = icons_lsp.DiagnosticWarn,
          [vim.diagnostic.severity.ERROR] = icons_lsp.DiagnosticError,
        },
        numhl = diagnostic_hl,
      },
      virtual_text = false,
      update_in_insert = false,
      underline = true,
      severity_sort = true,
      float = {
        focusable = true,
        border = border,
        source = "always",
        header = "",
        prefix = "",
      },
    }

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border })
    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border })

    -- ╭──────────────────────────────────────────────────────────╮
    -- │ setup on_attach and capabilities                         │
    -- ╰──────────────────────────────────────────────────────────╯
    local on_attach = require("core.utils").on_attach
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

    -- ╭──────────────────────────────────────────────────────────╮
    -- │ setup each server                                        │
    -- ╰──────────────────────────────────────────────────────────╯
    local servers = {
      "lua_ls", -- lua
      "yamlls", -- yaml
      "jsonls", -- json
      "clangd", -- c/c++
      "marksman", -- markdown
      "vale_ls", -- prose linter
      "taplo", -- toml
    }

    for _, server in ipairs(servers) do
      local opts = {
        on_attach = on_attach,
        capabilities = capabilities,
      }
      local require_ok, settings = pcall(require, "lspsettings." .. server)
      if require_ok then opts = vim.tbl_deep_extend("force", settings, opts) end

      if server == "lua_ls" then require("neodev").setup { library = { plugins = { "nvim-dap-ui" }, types = true } } end

      if server == "clangd" then
        local capabilities_clangd = {
          offsetEncoding = { "utf-16" },
        }
        opts.capabilities = vim.tbl_deep_extend("force", opts.capabilities, capabilities_clangd)
      end

      if server == "vale_ls" then
        function CheckAndLinkAcceptTxt()
          local vocab_path = vim.fn.getenv "HOME" .. "/.config/vale/styles/config/vocabularies/vocab/accept.txt"
          local nvim_spell_file = vim.fn.stdpath "config" .. "/spell/en.utf-8.add"
          local lstat = vim.loop.fs_lstat(vocab_path)
          if lstat then
            if lstat.type ~= "link" then
              -- If it exists but it's not a symlink, remove and create the symlink
              os.remove(vocab_path)
              os.execute("ln -s " .. nvim_spell_file .. " " .. vocab_path)
              require("core.utils").notify("", "WARN")
            end
          -- If it's a symlink, do nothing
          else
            -- If the file doesn't exist, create the symlink
            os.execute("ln -s " .. nvim_spell_file .. " " .. vocab_path)
          end
        end
        vim.api.nvim_create_autocmd("LspAttach", {
          callback = function() CheckAndLinkAcceptTxt() end,
        })
      end

      require("lspconfig")[server].setup(opts)
    end
  end,
}
