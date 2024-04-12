return {
    {
        "L3MON4D3/LuaSnip",
        dependencies = "rafamadriz/friendly-snippets",
        config = function()
            require("luasnip").config.setup {
                history = true,
                updateevents = "TextChanged,TextChangedI",
            }

            vim.tbl_map(
                function(type) require("luasnip.loaders.from_" .. type).lazy_load() end,
                { "vscode", "snipmate", "lua" }
            )

            -- fix: https://github.com/NvChad/NvChad/issues/1223
            vim.api.nvim_create_autocmd("InsertLeave", {
                callback = function()
                    if
                        require("luasnip").session.current_nodes[vim.api.nvim_get_current_buf()]
                        and not require("luasnip").session.jump_active
                    then
                        require("luasnip").unlink_current()
                    end
                end,
            })
        end,
    },
    {
        "zbirenbaum/copilot.lua",
        event = "InsertEnter",
        cmd = "Copilot",
        build = ":Copilot auth",
        config = function()
            require("copilot").setup {
                suggestion = { enabled = false },
                panel = { enabled = false },
                filetypes = {
                    yaml = true,
                    markdown = true,
                    help = true,
                    gitcommit = true,
                    gitrebase = true,
                },
            }
        end,
    },
    {
        "hrsh7th/nvim-cmp",
        event = { "InsertEnter", "CmdlineEnter" },
        dependencies = {
            "hrsh7th/cmp-buffer", -- source from text in buffer
            "hrsh7th/cmp-path", -- source from file system paths
            "hrsh7th/cmp-nvim-lsp", -- source from lsp server
            "hrsh7th/cmp-cmdline", -- source for cmdline
            "saadparwaiz1/cmp_luasnip", -- source from luasnip
            "zbirenbaum/copilot-cmp", -- source from copilot
            "onsails/lspkind.nvim", -- vs-code like pictograms
        },
        config = function()
            -- ╭──────────────────────────────────────────────────────────╮
            -- │ set highlight group                                      │
            -- ╰──────────────────────────────────────────────────────────╯
            require("core.utils").setPluginHighlights "cmp"

            -- ╭──────────────────────────────────────────────────────────╮
            -- │ setup cmdline source                                     │
            -- ╰──────────────────────────────────────────────────────────╯
            local cmp = require "cmp"
            -- `:` cmdline setup.
            cmp.setup.cmdline(":", {
                -- Disabling cmdline completion for IncRename
                -- see https://github.com/hrsh7th/nvim-cmp/wiki/Advanced-techniques#disabling-cmdline-completion-for-certain-commands-such-as-increname
                enabled = function()
                    local disabled = { IncRename = true }
                    local cmd = vim.fn.getcmdline():match "%S+"
                    return not disabled[cmd] or cmp.close()
                end,
                mapping = cmp.mapping.preset.cmdline(),
                sources = {
                    { name = "path" },
                    {
                        name = "cmdline",
                        option = {
                            ignore_cmds = { "Man", "!" },
                        },
                    },
                },
            })

            -- `/` cmdline setup.
            cmp.setup.cmdline("/", {
                mapping = cmp.mapping.preset.cmdline(),
                sources = {
                    { name = "buffer" },
                },
            })

            -- ╭──────────────────────────────────────────────────────────╮
            -- │ disable in telescope                                     │
            -- ╰──────────────────────────────────────────────────────────╯
            -- see https://github.com/hrsh7th/nvim-cmp/issues/1522
            vim.api.nvim_create_autocmd("FileType", {
                callback = function()
                    require("cmp").setup.filetype("TelescopePrompt", {
                        enabled = false,
                    })
                end,
            })

            -- ╭──────────────────────────────────────────────────────────╮
            -- │ setup plugin                                             │
            -- ╰──────────────────────────────────────────────────────────╯
            cmp.setup {
                -- see https://github.com/hrsh7th/nvim-cmp/pull/676#issuecomment-1002532096
                enabled = function()
                    -- disable completion in comments
                    local context = require "cmp.config.context"
                    -- keep command mode completion enabled when cursor is in a comment
                    if vim.api.nvim_get_mode().mode == "c" then
                        return true
                    else
                        return not context.in_treesitter_capture "comment" and not context.in_syntax_group "Comment"
                    end
                end,

                -- configure nvim-cmp to use Luasnip
                snippet = { expand = function(args) require("luasnip").lsp_expand(args.body) end },

                window = {
                    completion = {
                        border = require("core.utils").box_boarder "CmpPmenuBorder",
                        winhighlight = "Normal:CmpPmenu,CursorLine:CmpSel,Search:None",
                        scrollbar = false,
                        side_padding = 0,
                    },
                    documentation = {
                        border = require("core.utils").box_boarder "CmpDocBorder",
                        winhighlight = "Normal:CmpDoc",
                    },
                },

                mapping = {
                    ["<Up>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Select },
                    ["<Down>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Select },
                    ["<C-k>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
                    ["<C-j>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
                    ["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
                    ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
                    ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
                    ["<C-e>"] = cmp.mapping { i = cmp.mapping.abort(), c = cmp.mapping.close() },
                    ["<CR>"] = cmp.mapping.confirm { select = false },
                    ["<Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif require("luasnip").expand_or_jumpable() then
                            vim.fn.feedkeys(
                                vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true),
                                ""
                            )
                        else
                            fallback()
                        end
                    end, { "i", "s" }),

                    ["<S-Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif require("luasnip").jumpable(-1) then
                            vim.fn.feedkeys(
                                vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true),
                                ""
                            )
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                },

                sources = {
                    {
                        name = "nvim_lsp",
                        priority = 1000,
                        entry_filter = function(entry, ctx)
                            local kind = require("cmp.types.lsp").CompletionItemKind[entry:get_kind()]
                            if ctx.prev_context.filetype == "markdown" then return true end
                            if kind == "Text" then return false end
                            return true
                        end,
                    },
                    { name = "luasnip", priority = 800 },
                    { name = "copilot", priority = 600 },
                    { name = "buffer", priority = 400 },
                    { name = "path", priority = 200 },
                },

                -- get types on the left
                formatting = {
                    fields = { "kind", "abbr", "menu" },
                    format = function(entry, vim_item)
                        local kind = require("lspkind").cmp_format {
                            mode = "symbol_text",
                            maxwidth = 50,
                            ellipsis_char = "...",
                            symbol_map = { Copilot = "" },
                            menu = {
                                buffer = "[Buffer]",
                                nvim_lsp = "[LSP]",
                                luasnip = "[LuaSnip]",
                                path = "[Path]",
                                copilot = "[Copilot]",
                                cmdline = "[Cmdline]",
                            },
                        }(entry, vim_item)
                        local strings = vim.split(kind.kind, "%s", { trimempty = true })
                        kind.kind = " " .. (strings[1] or "") .. " "
                        return kind
                    end,
                },
            }

            require("copilot_cmp").setup()
        end,
    },
}
