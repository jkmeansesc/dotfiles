return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "debugloop/telescope-undo.nvim",
    "nvim-telescope/telescope-ui-select.nvim",
    "2kabhishek/nerdy.nvim", -- search nerd icons
    { "nvim-telescope/telescope-fzf-native.nvim", enabled = vim.fn.executable "make" == 1, build = "make" },
  },
  event = "VimEnter",
  keys = {
    { "<Leader>ff", "<CMD>Telescope find_files<CR>", desc = "Find files" },
    { "<Leader>fa", "<CMD>Telescope find_files follow=true no_ignore=true hidden=true<CR>", desc = "Find all" },
    { "<Leader>fg", "<CMD>Telescope live_grep<CR>", desc = "Live grep" },
    { "<Leader>fb", "<CMD>Telescope buffers<CR>", desc = "Find buffers" },
    { "<Leader>fh", "<CMD>Telescope help_tags<CR>", desc = "Help page" },
    { "<Leader>fH", "<CMD>Telescope highlights<CR>", desc = "Find highlights" },
    { "<Leader>fo", "<CMD>Telescope oldfiles<CR>", desc = "Find oldfiles" },
    { "<Leader><Leader>", "<CMD>Telescope current_buffer_fuzzy_find<CR>", desc = "Find in current buffer" },
    { "<Leader>fM", "<CMD>Telescope marks<CR>", desc = "Telescope bookmarks" },
    { "<Leader>fu", "<CMD>Telescope undo<CR>", desc = "Find undo" },
    { "<Leader>fi", "<CMD>Nerdy<CR>", desc = "Find icons" },
    { "<Leader>gc", "<CMD>Telescope git_commits<CR>", desc = "Git commits" },
    { "<Leader>gS", "<CMD>Telescope git_status<CR>", desc = "Git status" },
  },
  config = function()
    local actions = require "telescope.actions"
    local telescope = require "telescope"
    local icons = require "core.icons"

    require("core.utils").setPluginHighlights "telescope"

    telescope.setup {
      defaults = {
        prompt_prefix = icons.Search .. "  ",
        selection_caret = icons.Selected .. "  ",
        layout_config = {
          horizontal = {
            preview_width = 0.50,
          },
          width = 0.80,
          height = 0.80,
        },
        winblend = 0, -- set transparency (0 to 30 most useful)
        path_display = { "truncate" },
        vimgrep_arguments = {
          "rg",
          "-L",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
          "--trim",
          "--hidden",
          -- I don't want to search in the `.git` directory.
          "--glob",
          "!**/.git/*",
        },
        file_ignore_patterns = {
          "node_modules/",
          "%.git/",
          "%.DS_Store$",
          "target/",
          "build/",
          "%.o$",
        },
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous, -- move to prev result
            ["<C-j>"] = actions.move_selection_next, -- move to next result
            ["<C-e>"] = actions.close, -- close telescope
            ["<C-n>"] = actions.cycle_history_next, -- cycle previewer next
            ["<C-p>"] = actions.cycle_history_prev, -- cycle previewer prev
          },
          n = {
            ["q"] = actions.close, -- close telescope
          },
        },
      },
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case",
        },
        undo = {},
        ["ui-select"] = { require("telescope.themes").get_dropdown {} },
      },
    }
    telescope.load_extension "fzf"
    telescope.load_extension "undo"
    telescope.load_extension "ui-select"
  end,
}
