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
        initial_mode = "insert",
        selection_strategy = "reset",
        sorting_strategy = "ascending",
        file_ignore_patterns = { "node_modules" },
        path_display = { "truncate" },
        color_devicons = true,
        set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
        -- mappings = {
        --     n = { ["q"] = require("telescope.actions").close },
        -- },
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

-- load extensions
for _, ext in ipairs(telescope.extensions_list) do
    telescope.load_extension(ext)
end
