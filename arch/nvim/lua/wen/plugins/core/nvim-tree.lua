return {
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = { "nvim-tree/nvim-web-devicons" },

        config = function()
            -- recommended settings from nvim-tree documentation
            vim.g.loaded_netrw = 1
            vim.g.loaded_netrwPlugin = 1

            -- close the tab/nvim when nvim-tree is the last window
            vim.api.nvim_create_autocmd("QuitPre", {
                callback = function()
                    local tree_wins = {}
                    local floating_wins = {}
                    local wins = vim.api.nvim_list_wins()
                    for _, w in ipairs(wins) do
                        local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(w))
                        if bufname:match "NvimTree_" ~= nil then table.insert(tree_wins, w) end
                        if vim.api.nvim_win_get_config(w).relative ~= "" then table.insert(floating_wins, w) end
                    end
                    if 1 == #wins - #floating_wins - #tree_wins then
                        -- Should quit, so we close all invalid windows.
                        for _, w in ipairs(tree_wins) do
                            vim.api.nvim_win_close(w, true)
                        end
                    end
                end,
            })

            -- automatically open file upon creation
            local api = require "nvim-tree.api"
            api.events.subscribe(api.events.Event.FileCreated, function(file) vim.cmd("edit " .. file.fname) end)

            -- see setup for definition
            -- local function natural_cmp(left, right)
            --     left = left.name:lower()
            --     right = right.name:lower()
            --
            --     if left == right then return false end
            --
            --     for i = 1, math.max(string.len(left), string.len(right)), 1 do
            --         local l = string.sub(left, i, -1)
            --         local r = string.sub(right, i, -1)
            --
            --         if
            --             type(tonumber(string.sub(l, 1, 1))) == "number"
            --             and type(tonumber(string.sub(r, 1, 1))) == "number"
            --         then
            --             local l_number = tonumber(string.match(l, "^[0-9]+"))
            --             local r_number = tonumber(string.match(r, "^[0-9]+"))
            --
            --             if l_number ~= r_number then return l_number < r_number end
            --         elseif string.sub(l, 1, 1) ~= string.sub(r, 1, 1) then
            --             return l < r
            --         end
            --     end
            -- end

            -- configure nvim-tree
            require("nvim-tree").setup {
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

                -- automatically focus opend file by Enter <CR>
                on_attach = function(bufnr)
                    local function opts(desc)
                        return {
                            desc = "nvim-tree: " .. desc,
                            buffer = bufnr,
                            noremap = true,
                            silent = true,
                            nowait = true,
                        }
                    end
                    local ok, api = pcall(require, "nvim-tree.api")
                    assert(ok, "api module is not found")
                    vim.keymap.set("n", "<CR>", api.node.open.tab_drop, opts "Tab drop")
                end,

                -- sort as 1 foo, 3 foo, 20 foo rather than 1 foo, 20 foo, 3 foo
                -- sort_by = function(nodes) table.sort(nodes, natural_cmp) end,
            }
        end,
    },

    {
        "folke/which-key.nvim",
        config = function()
            require("which-key").register {
                ["<leader>e"] = { "<cmd>NvimTreeFindFileToggle<CR>", "Toggle explorer on current file" },
            }
        end,
    },
}
