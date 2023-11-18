return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
  },
  config = function()
    local lspconfig = require "lspconfig"
    local cmp_nvim_lsp = require "cmp_nvim_lsp"

    -- local opts = { noremap = true, silent = true }
    local on_attach = function(client, bufnr)
      -- opts.buffer = bufnr
    end

    -- used to enable autocompletion (assign to every lsp server config)
    local capabilities = cmp_nvim_lsp.default_capabilities()

    -- Change the Diagnostic symbols in the sign column (gutter)
    local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    -- configure html server
    lspconfig["html"].setup {
      capabilities = capabilities,
      on_attach = on_attach,
    }

    -- configure css server
    lspconfig["cssls"].setup {
      capabilities = capabilities,
      on_attach = on_attach,
    }

    -- configure emmet language server
    lspconfig["emmet_ls"].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
    }

    -- configure lua server (with special settings)
    lspconfig["lua_ls"].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = { -- custom settings for lua
        Lua = {
          -- make the language server recognize "vim" global
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            -- make language server aware of runtime files
            library = {
              [vim.fn.expand "$VIMRUNTIME/lua"] = true,
              [vim.fn.stdpath "config" .. "/lua"] = true,
            },
          },
        },
      },
    }
    -- configure python server
    lspconfig["pyright"].setup {
      capabilities = capabilities,
      on_attach = on_attach,
    }

    -- configure markdown server
    lspconfig["marksman"].setup {
      capabilities = capabilities,
      on_attach = on_attach,
    }

    -- configure yaml server
    lspconfig["yamlls"].setup {
      capabilities = capabilities,
      on_attach = on_attach,
    }

    -- configure json server
    lspconfig["jsonls"].setup {
      capabilities = capabilities,
      on_attach = on_attach,
    }

    -- configure ansible server
    lspconfig["ansiblels"].setup {
      capabilities = capabilities,
      on_attach = on_attach,
    }

    lspconfig["docker_compose_language_server"].setup {
      capabilities = capabilities,
      on_attach = on_attach,
    }

    lspconfig["dockerls"].setup {
      capabilities = capabilities,
      on_attach = on_attach,
    }

    lspconfig["lemminx"].setup {
      capabilities = capabilities,
      on_attach = on_attach,
    }
  end,
}
