return {
  "williamboman/mason.nvim",
  cmd = {
    "Mason",
    "MasonInstall",
    "MasonUninstall",
    "MasonUninstallAll",
    "MasonLog",
    "MasonUpdate",
    "MasonUpdateAll",
  },
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "jay-babu/mason-null-ls.nvim",
    { "jay-babu/mason-nvim-dap.nvim", dependencies = { "nvim-dap" } },
  },
  config = function()
    require("mason").setup {
      ui = {
        icons = {
          package_pending = " ",
          package_installed = "󰄳 ",
          package_uninstalled = " 󰚌",
        },
      },
    }

    require("mason-lspconfig").setup {
      ensure_installed = {
        "html",
        "cssls",
        "emmet_ls", -- html, css
        "lua_ls", -- lua
        "pyright", -- python
        "marksman", -- markdown
        "yamlls", -- yaml
        "jsonls", -- json
        "ansiblels", -- ansible
        "docker_compose_language_service", -- docker compose
        "dockerls", -- docker
        "jdtls", -- java
        "lemminx", -- xml
        "clangd", -- c/c++
      },
      automatic_installation = true,
    }

    require("mason-null-ls").setup {
      ensure_installed = {
        "stylua", -- lua formatter
        "black", -- python formatter
        "isort", -- python formatter
        "pylint", -- python linter
        "eslint_d", -- js linter
        "markdownlint", -- markdownlinter
        "prettierd", -- prettier formatter
        "ansiblelint", -- ansible linter
        "hadolint", -- dockerfile linter
        "google_java_format", -- java formatter
      },
    }

    require("mason-nvim-dap").setup {
      ensure_installed = {
        "javadbg", -- java debugger
        "javatest", -- java test runner
        "codelldb", -- c/c++ debugger
      },
    }
  end,
}
