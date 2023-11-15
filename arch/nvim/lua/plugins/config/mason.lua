return function()
    require("mason").setup {
        ui = {
            icons = {
                package_installed = "✓",
                package_pending = "➜",
                package_uninstalled = "✗",
            },
        },
    }

    require("mason-lspconfig").setup {
        ensure_installed = {
            "tsserver",
            "html",
            "cssls",
            "tailwindcss",
            "svelte",
            "lua_ls",
            "graphql",
            "emmet_ls",
            "prismals",
            "pyright",
        },
        automatic_installation = true,
    }
end
