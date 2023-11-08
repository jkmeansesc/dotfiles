return {
    {
        "echasnovski/mini.animate",
        event = "VeryLazy",
        cond = not vim.g.neovide,
        opts = function()
            -- don't use animate when scrolling with the mouse
            local mouse_scrolled = false
            for _, scroll in ipairs { "Up", "Down" } do
                local key = "<ScrollWheel" .. scroll .. ">"
                vim.keymap.set({ "", "i" }, key, function()
                    mouse_scrolled = true
                    return key
                end, { expr = true })
            end

            local animate = require "mini.animate"
            return {
                resize = {
                    timing = animate.gen_timing.linear { duration = 100, unit = "total" },
                },
                scroll = {
                    timing = animate.gen_timing.linear { duration = 150, unit = "total" },
                    subscroll = animate.gen_subscroll.equal {
                        predicate = function(total_scroll)
                            if mouse_scrolled then
                                mouse_scrolled = false
                                return false
                            end
                            return total_scroll > 1
                        end,
                    },
                },
            }
        end,
    },

    {
        "Exafunction/codeium.nvim",
        event = "BufEnter",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "hrsh7th/nvim-cmp",
        },
        config = function() require("codeium").setup {} end,
    },

    -- {
    --     "echasnovski/mini.indentscope",
    --     event = "User AstroFile",
    --     opts = { symbol = "│", options = { try_as_border = true } },
    --     init = function()
    --         vim.api.nvim_create_autocmd("FileType", {
    --             desc = "Disable indentscope for certain filetypes",
    --             pattern = {
    --                 "Trouble",
    --                 "aerial",
    --                 "alpha",
    --                 "checkhealth",
    --                 "dashboard",
    --                 "fzf",
    --                 "help",
    --                 "lazy",
    --                 "lspinfo",
    --                 "man",
    --                 "mason",
    --                 "neo-tree",
    --                 "notify",
    --                 "null-ls-info",
    --                 "starter",
    --                 "toggleterm",
    --                 "undotree",
    --             },
    --             callback = function(event) vim.b[event.buf].miniindentscope_disable = true end,
    --         })
    --         vim.api.nvim_create_autocmd("BufWinEnter", {
    --             desc = "Disable indentscope for certain buftypes",
    --             callback = function(event)
    --                 if
    --                     vim.tbl_contains({
    --                         "nofile",
    --                         "prompt",
    --                         "quickfix",
    --                         "terminal",
    --                     }, vim.bo[event.buf].buftype)
    --                 then
    --                     vim.b[event.buf].miniindentscope_disable = true
    --                 end
    --             end,
    --         })
    --         vim.api.nvim_create_autocmd("TermOpen", {
    --             desc = "Disable indentscope for terminals",
    --             callback = function(event) vim.b[event.buf].miniindentscope_disable = true end,
    --         })
    --     end,
    -- },

    {
        "folke/trouble.nvim",
        cmd = { "TroubleToggle", "Trouble" },
        keys = {
            { "<leader>xX", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Workspace Diagnostics (Trouble)" },
            { "<leader>xx", "<cmd>TroubleToggle document_diagnostics<cr>", desc = "Document Diagnostics (Trouble)" },
            { "<leader>xl", "<cmd>TroubleToggle loclist<cr>", desc = "Location List (Trouble)" },
            { "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", desc = "Quickfix List (Trouble)" },
        },
        opts = {
            use_diagnostic_signs = true,
            action_keys = {
                close = { "q", "<esc>" },
                cancel = "<c-e>",
            },
        },
        require("astronvim.utils").set_mappings {
            n = {
                ["<leader>x"] = { desc = "󱍼 Trouble" },
            },
        },
    },

    {
        "folke/noice.nvim",
        event = "VeryLazy",
        dependencies = { "MunifTanjim/nui.nvim" },
        opts = function(_, opts)
            local utils = require "astronvim.utils"
            return utils.extend_tbl(opts, {
                lsp = {
                    -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
                    override = {
                        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                        ["vim.lsp.util.stylize_markdown"] = true,
                        ["cmp.entry.get_documentation"] = true,
                    },
                },
                presets = {
                    bottom_search = true, -- use a classic bottom cmdline for search
                    command_palette = true, -- position the cmdline and popupmenu together
                    long_message_to_split = true, -- long messages will be sent to a split
                    inc_rename = utils.is_available "inc-rename.nvim", -- enables an input dialog for inc-rename.nvim
                    lsp_doc_border = false, -- add a border to hover docs and signature help
                },
            })
        end,
        init = function() vim.g.lsp_handlers_enabled = false end,
    },

    {
        "lukas-reineke/headlines.nvim",
        opts = function()
            local opts = {}
            for _, ft in ipairs { "markdown", "norg", "rmd", "org" } do
                opts[ft] = {
                    headline_highlights = {},
                }
                for i = 1, 6 do
                    local hl = "Headline" .. i
                    vim.api.nvim_set_hl(0, hl, { link = "Headline", default = true })
                    table.insert(opts[ft].headline_highlights, hl)
                end
            end
            return opts
        end,
        ft = { "markdown", "norg", "rmd", "org" },
        config = function(_, opts)
            -- PERF: schedule to prevent headlines slowing down opening a file
            vim.schedule(function()
                require("headlines").setup(opts)
                require("headlines").refresh()
            end)
        end,
    },
}
