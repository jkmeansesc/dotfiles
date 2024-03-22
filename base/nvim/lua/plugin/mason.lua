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
  opts = {
    ui = {
      icons = {
        package_pending = " ",
        package_installed = "󰄳 ",
        package_uninstalled = " 󰚌",
      },
    },
  },
  config = function()
    require("mason-lspconfig").setup {
      automatic_installation = true,
      ensure_installed = {
        "lua_ls", -- lua
        "yamlls", -- yaml
        "jsonls", -- json
        "jdtls", -- java
        "clangd", -- c/c++
        "marksman", -- markdown
      },
    }

    require("mason-null-ls").setup {
      automatic_installation = true,
      ensure_installed = {
        "stylua", -- lua formatter
        "markdownlint", -- markdownlinter
        "prettier", -- prettier formatter
        "google_java_format", -- java formatter
      },
    }

    require("mason-nvim-dap").setup {
      automatic_installation = true,
      ensure_installed = {
        "javadbg", -- java debugger
        "javatest", -- java test runner
        "codelldb", -- c/c++ debugger
      },
    }
  end,
}
