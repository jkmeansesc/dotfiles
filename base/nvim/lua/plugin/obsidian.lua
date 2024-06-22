return {
    "epwalsh/obsidian.nvim",
    version = "*",
    event = {
        "BufReadPre " .. vim.fn.expand "~" .. "/git/obsidian/**.md",
        "BufNewFile " .. vim.fn.expand "~" .. "/git/obsidian/**.md",
    },
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = function()
        require("obsidian").setup {
            dir = "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/Obsidian",
            new_notes_location = "notes_subdir",
            disable_frontmatter = true,
            ui = {
                enable = false,
            },
        }
    end,
}
