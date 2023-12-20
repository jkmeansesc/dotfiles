return function()
  local lspconfig = require "lspconfig"
  local cmp_nvim_lsp = require "cmp_nvim_lsp"
  local capabilities = cmp_nvim_lsp.default_capabilities(vim.lsp.protocol.make_client_capabilities())

  local on_attach = function(client, bufnr)
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false

    -- enable inlay hints
    if client.server_capabilities.inlayHintProvider then
      vim.g.inlay_hints_visible = true
      vim.lsp.inlay_hint.enable(bufnr, true)
    else
      print(client.name .. " has no inlay hints available")
    end

    if client.name == "clangd" then require("core.utils").load_mappings "on_attach_cpp" end

    if client.name == "ltex" then
      require("ltex_extra").setup { path = vim.api.nvim_call_function("stdpath", { "cache" }) .. "/ltex/" }
    end

    require("core.utils").load_mappings "on_attach_default"
  end

  -- Change the Diagnostic symbols in the sign column (gutter)
  local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
  for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
  end

  local servers = {
    "html",
    "cssls",
    "pyright",
    "pyright",
    "jsonls",
    "ansiblels",
    "docker_compose_language_service",
    "dockerls",
    "lemminx",
    "marksman",
  }

  for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
      on_attach = on_attach,
      capabilities = capabilities,
    }
  end

  lspconfig["emmet_ls"].setup {
    capabilities = capabilities,
    on_attach = on_attach,
    filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
  }

  lspconfig["lua_ls"].setup {
    capabilities = capabilities,
    on_attach = on_attach,
    settings = { -- custom settings for lua
      Lua = {
        -- make the language server recognize "vim" global
        diagnostics = { globals = { "vim" } },
      },
    },
  }

  lspconfig["yamlls"].setup {
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
      yaml = {
        schemas = {
          ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
          ["../path/relative/to/file.yml"] = "/.github/workflows/*",
          ["/path/from/root/of/project"] = "/.github/workflows/*",
        },
      },
    },
  }

  lspconfig["clangd"].setup {
    on_attach = on_attach,
    root_dir = function(fname)
      return require("lspconfig.util").root_pattern(
        "Makefile",
        "configure.ac",
        "configure.in",
        "config.h.in",
        "meson.build",
        "meson_options.txt",
        "build.ninja"
      )(fname) or require("lspconfig.util").root_pattern("compile_commands.json", "compile_flags.txt")(fname) or require(
        "lspconfig.util"
      ).find_git_ancestor(fname)
    end,
    capabilities = {
      offsetEncoding = { "utf-16" },
    },
    cmd = {
      "clangd",
      "--background-index",
      "--clang-tidy",
      "--header-insertion=iwyu",
      "--completion-style=detailed",
      "--function-arg-placeholders",
      "--fallback-style=llvm",
    },
    init_options = {
      usePlaceholders = true,
      completeUnimported = true,
      clangdFileStatus = true,
    },
  }

  lspconfig["ltex"].setup {
    capabilities = capabilities,
    on_attach = on_attach,
    filetypes = { "latex", "tex", "bib", "markdown", "gitcommit", "text" },
  }
end
