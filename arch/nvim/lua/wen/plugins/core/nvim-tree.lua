return {
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = { "nvim-tree/nvim-web-devicons" },

        opts = {
            filters = {
                dotfiles = false,
            },
            disable_netrw = true,
            hijack_netrw = true,
            hijack_cursor = true,
            hijack_unnamed_buffer_when_opening = false,
            sync_root_with_cwd = true,
            update_focused_file = {
                enable = true,
                update_root = false,
            },
            view = {
                adaptive_size = false,
                side = "left",
                width = 30,
                preserve_window_proportions = true,
            },
            git = {
                enable = false,
                ignore = true,
            },
            filesystem_watchers = {
                enable = true,
            },
            actions = {
                open_file = {
                    resize_window = true,
                },
            },
            renderer = {
                root_folder_label = false,
                highlight_git = false,
                highlight_opened_files = "none",

                indent_markers = {
                    enable = false,
                },

                icons = {
                    show = {
                        file = true,
                        folder = true,
                        folder_arrow = true,
                        git = false,
                    },

                    glyphs = {
                        default = "󰈚",
                        symlink = "",
                        folder = {
                            default = "",
                            empty = "",
                            empty_open = "",
                            open = "",
                            symlink = "",
                            symlink_open = "",
                            arrow_open = "",
                            arrow_closed = "",
                        },
                        git = {
                            unstaged = "✗",
                            staged = "✓",
                            unmerged = "",
                            renamed = "➜",
                            untracked = "★",
                            deleted = "",
                            ignored = "◌",
                        },
                    },
                },
            },
        },

        config = function(_, opts)
            -- recommended settings from nvim-tree documentation
            vim.g.loaded_netrw = 1
            vim.g.loaded_netrwPlugin = 1

            -- configure nvim-tree
            require("nvim-tree").setup { opts }
        end,
    },

    {
        "folke/which-key.nvim",
        require("which-key").register {
            ["<leader>e"] = { "<cmd>NvimTreeFindFileToggle<CR>", "Toggle explorer on current file" },
        },
    },
}
