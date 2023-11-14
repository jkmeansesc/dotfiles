return function()
    local telescope = require "telescope"
    telescope.setup {
        defaults = {
            vimgrep_arguments = {
                "rg",
                "-L",
                "--color=never",
                "--no-heading",
                "--with-filename",
                "--line-number",
                "--column",
                "--smart-case",
            },
            prompt_prefix = "   ",
            selection_caret = "  ",
            entry_prefix = "  ",
            file_ignore_patterns = { "node_modules" },
            path_display = { "truncate" },
            color_devicons = true,
            set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
            mappings = {
                n = { ["q"] = require("telescope.actions").close },
            },
        },
        extensions_list = { "themes", "terms", "fzf" },
        extensions = {
            fzf = {
                fuzzy = true,
                override_generic_sorter = true,
                override_file_sorter = true,
                case_mode = "smart_case",
            },
        },
    }
    telescope.load_extension("fzf")
    -- load extensions
    -- for _, ext in ipairs(telescope.extensions_list) do
    --     telescope.load_extension(ext)
    -- end

    -- vim.keymap.set(
    --     "n",
    --     "<leader>gb",
    --     function() require("telescope.builtin").git_branches { use_file_path = true } end,
    --     { desc = "Git branches" }
    -- )
    -- vim.keymap.set(
    --     "n",
    --     "<leader>gc",
    --     function() require("telescope.builtin").git_commits { use_file_path = true } end,
    --     { desc = "Git commits (repository)" }
    -- )
    -- vim.keymap.set(
    --     "n",
    --     "<leader>gC",
    --     function() require("telescope.builtin").git_bcommits { use_file_path = true } end,
    --     { desc = "Git commits (current file)" }
    -- )
    -- vim.keymap.set(
    --     "n",
    --     "<leader>gt",
    --     function() require("telescope.builtin").git_status { use_file_path = true } end,
    --     { desc = "Git status" }
    -- )
    -- vim.keymap.set(
    --     "n",
    --     "<leader>f<CR>",
    --     function() require("telescope.builtin").resume() end,
    --     { desc = "Resume previous search" }
    -- )
    -- vim.keymap.set("n", "<leader>f'", function() require("telescope.builtin").marks() end, { desc = "Find marks" })
    -- vim.keymap.set(
    --     "n",
    --     "<leader>f/",
    --     function() require("telescope.builtin").current_buffer_fuzzy_find() end,
    --     { desc = "Find words in current buffer" }
    -- )
    -- vim.keymap.set("n", "<leader>fb", function() require("telescope.builtin").buffers() end, { desc = "Find buffers" })
    -- vim.keymap.set(
    --     "n",
    --     "<leader>fc",
    --     function() require("telescope.builtin").grep_string() end,
    --     { desc = "Find word under cursor" }
    -- )
    -- vim.keymap.set("n", "<leader>fC", function() require("telescope.builtin").commands() end, { desc = "Find commands" })
    vim.keymap.set("n", "<leader>ff", function() require("telescope.builtin").find_files() end, { desc = "Find files" })
    -- vim.keymap.set(
    --     "n",
    --     "<leader>fF",
    --     function() require("telescope.builtin").find_files { hidden = true, no_ignore = true } end,
    --     { desc = "Find all files" }
    -- )
    -- vim.keymap.set("n", "<leader>fh", function() require("telescope.builtin").help_tags() end, { desc = "Find help" })
    -- vim.keymap.set("n", "<leader>fk", function() require("telescope.builtin").keymaps() end, { desc = "Find keymaps" })
    -- vim.keymap.set("n", "<leader>fm", function() require("telescope.builtin").man_pages() end, { desc = "Find man" })
    -- vim.keymap.set(
    --     "n",
    --     "<leader>fn",
    --     function() require("telescope").extensions.notify.notify() end,
    --     { desc = "Find notifications" }
    -- )
    -- vim.keymap.set("n", "<leader>fo", function() require("telescope.builtin").oldfiles() end, { desc = "Find history" })
    -- vim.keymap.set("n", "<leader>fr", function() require("telescope.builtin").registers() end, { desc = "Find registers" })
    -- vim.keymap.set(
    --     "n",
    --     "<leader>ft",
    --     function() require("telescope.builtin").colorscheme { enable_preview = true } end,
    --     { desc = "Find themes" }
    -- )
    -- vim.keymap.set("n", "<leader>fw", function() require("telescope.builtin").live_grep() end, { desc = "Find words" })
    -- vim.keymap.set("n", "<leader>fW", function()
    --     require("telescope.builtin").live_grep.additional_args = function(args)
    --         return vim.list_extend(args, { "--hidden", "--no-ignore" })
    --     end
    -- end, { desc = "Find words in all files" })
    -- -- vim.keymap.set("n", "<leader>ls", telescope.extensions.aerial.aerial(), { desc = "search symbols" })
end
