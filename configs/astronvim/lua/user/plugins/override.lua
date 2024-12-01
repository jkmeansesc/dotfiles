-- override/extend default plugins
return {
    {
        "goolord/alpha-nvim",
        opts = function(_, opts) -- override the options using lazy.nvim
            local logo = [[
                  ████ ██████           █████      ██
                 ███████████             █████ 
                 █████████ ███████████████████ ███   ███████████
                █████████  ███    █████████████ █████ ██████████████
               █████████ ██████████ █████████ █████ █████ ████ █████
             ███████████ ███    ███ █████████ █████ █████ ████ █████
            ██████  █████████████████████ ████ █████ █████ ████ ██████
            ]]
            opts.section.header.val = vim.split(logo, "\n")
        end,
    },

    {
        "williamboman/mason-lspconfig.nvim",
        opts = function(_, opts)
            opts.ensure_installed = require("astronvim.utils").list_insert_unique(opts.ensure_installed, {
                "lua_ls",
            })
        end,
    },

    {
        "jay-babu/mason-null-ls.nvim",
        opts = function(_, opts)
            opts.ensure_installed = require("astronvim.utils").list_insert_unique(opts.ensure_installed, {
                "prettier",
                "stylua",
                "markdownlint",
            })
        end,
    },

    {
        "jay-babu/mason-nvim-dap.nvim",
        opts = function(_, opts)
            opts.ensure_installed = require("astronvim.utils").list_insert_unique(opts.ensure_installed, {
                "python",
            })
        end,
    },

    {
        "jose-elias-alvarez/null-ls.nvim",
        opts = function(_, config)
            config.sources = {
                -- Set a formatter
                -- null_ls.builtins.formatting.stylua,
                -- null_ls.builtins.formatting.prettier,
            }
            return config -- return final config table
        end,
    },

    {
        "nvim-treesitter/nvim-treesitter",
        opts = function(_, opts)
            -- add more things to the ensure_installed table protecting against community packs modifying it
            opts.ensure_installed = require("astronvim.utils").list_insert_unique(opts.ensure_installed, {
                "json",
                "javascript",
                "yaml",
                "html",
                "css",
                "markdown",
                "markdown_inline",
                "bash",
                "lua",
                "vim",
                "dockerfile",
                "gitignore",
                "query",
                "java",
                "python",
                "c",
                "xml",
                "regex",
            })
        end,
    },

    {
        "lukas-reineke/indent-blankline.nvim",
        opts = function(_, opts)
            opts.scope = { enabled = false }
            opts.whitespace = { remove_blankline_trail = true }
        end,
    },

    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "debugloop/telescope-undo.nvim",
        },
        keys = { { "<leader>fu", "<cmd>Telescope undo<CR>", desc = "Find undos" } },
        opts = function() require("telescope").load_extension "undo" end,
    },

    {
        "L3MON4D3/LuaSnip",
        config = function(plugin, opts)
            require "plugins.configs.luasnip"(plugin, opts) -- include the default astronvim config that calls the setup call
            -- add more custom luasnip configuration such as filetype extend or custom snippets
            local luasnip = require "luasnip"
            luasnip.filetype_extend("javascript", { "javascriptreact" })
        end,
    },

    {
        "windwp/nvim-autopairs",
        config = function(plugin, opts)
            require "plugins.configs.nvim-autopairs"(plugin, opts) -- include the default astronvim config that calls the setup call
            -- add more custom autopairs configuration such as custom rules
            local npairs = require "nvim-autopairs"
            local Rule = require "nvim-autopairs.rule"
            local cond = require "nvim-autopairs.conds"
            npairs.add_rules(
                {
                    Rule("$", "$", { "tex", "latex" })
                        -- don't add a pair if the next character is %
                        :with_pair(
                            cond.not_after_regex "%%"
                        )
                        -- don't add a pair if the previous character is xxx
                        :with_pair(
                            cond.not_before_regex("xxx", 3)
                        )
                        -- don't move right when repeat character
                        :with_move(cond.none())
                        -- don't delete if the next character is xx
                        :with_del(
                            cond.not_after_regex "xx"
                        )
                        -- disable adding a newline when you press <cr>
                        :with_cr(cond.none()),
                },
                -- disable for .vim files, but it work for another filetypes
                Rule("a", "a", "-vim")
            )
        end,
    },

    {
        -- default statusline with mode text
        "rebelot/heirline.nvim",
        opts = function(_, opts)
            local status = require "astronvim.utils.status"
            opts.statusline = { -- statusline
                hl = { fg = "fg", bg = "bg" },
                status.component.mode { mode_text = { padding = { left = 1, right = 1 } } }, -- add the mode text
                status.component.git_branch(),
                status.component.file_info { filetype = {}, filename = false, file_modified = false },
                status.component.git_diff(),
                status.component.diagnostics(),
                status.component.fill(),
                status.component.cmd_info(),
                status.component.fill(),
                status.component.lsp(),
                status.component.treesitter(),
                status.component.nav(),
                -- remove the 2nd mode indicator on the right
            }

            -- return the final configuration table
            return opts
        end,
    },

    {
        "rebelot/heirline.nvim",
        opts = function(_, opts)
            local status = require "astronvim.utils.status"

            opts.winbar = { -- create custom winbar
                -- store the current buffer number
                init = function(self) self.bufnr = vim.api.nvim_get_current_buf() end,
                fallthrough = false, -- pick the correct winbar based on condition
                -- inactive winbar
                {
                    condition = function() return not status.condition.is_active() end,
                    -- show the path to the file relative to the working directory
                    status.component.separated_path { path_func = status.provider.filename { modify = ":.:h" } },
                    -- add the file name and icon
                    status.component.file_info {
                        file_icon = { hl = status.hl.file_icon "winbar", padding = { left = 0 } },
                        file_modified = false,
                        file_read_only = false,
                        hl = status.hl.get_attributes("winbarnc", true),
                        surround = false,
                        update = "BufEnter",
                    },
                },
                -- active winbar
                {
                    -- show the path to the file relative to the working directory
                    status.component.separated_path { path_func = status.provider.filename { modify = ":.:h" } },
                    -- add the file name and icon
                    status.component.file_info { -- add file_info to breadcrumbs
                        file_icon = { hl = status.hl.filetype_color, padding = { left = 0 } },
                        file_modified = false,
                        file_read_only = false,
                        hl = status.hl.get_attributes("winbar", true),
                        surround = false,
                        update = "BufEnter",
                    },
                    -- show the breadcrumbs
                    status.component.breadcrumbs {
                        icon = { hl = true },
                        hl = status.hl.get_attributes("winbar", true),
                        prefix = true,
                        padding = { left = 0 },
                    },
                },
            }

            return opts
        end,
    },
}
