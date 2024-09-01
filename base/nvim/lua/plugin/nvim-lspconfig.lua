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
        vim.lsp.handlers["textDocument/signatureHelp"] =
            vim.lsp.with(vim.lsp.handlers.signature_help, { border = border })

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
            "html", -- html
            "cssls", -- css
            "lua_ls", -- lua
            "yamlls", -- yaml
            "jsonls", -- json
            "marksman", -- markdown
            "taplo", -- toml
        }

        for _, server in ipairs(servers) do
            local opts = {
                on_attach = on_attach,
                capabilities = capabilities,
            }
            local require_ok, settings = pcall(require, "lspsettings." .. server)
            if require_ok then opts = vim.tbl_deep_extend("force", settings, opts) end

            if server == "lua_ls" then
                require("neodev").setup { library = { plugins = { "nvim-dap-ui" }, types = true } }
            end

            require("lspconfig")[server].setup(opts)
        end
    end,
}
