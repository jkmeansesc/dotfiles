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
    { "<Leader>fa", "<CMD>Telescope find_files follow=true no_ignore=true hidden=true<CR>", desc = "Find all" },
    { "<Leader>fA", "<CMD>Telescope autocommands<CR>", desc = "Autocommands" },
    { "<Leader>fc", "<CMD>Telescope command_history<CR>", desc = "Command history" },
    { "<Leader>fd", "<CMD>Telescope commands<CR>", desc = "Search commands" },
    { "<Leader>ff", "<CMD>Telescope find_files<CR>", desc = "Find files" },
    { "<Leader>fF", "<CMD>Telescope filetypes<CR>", desc = "Filetypes" },
    { "<Leader>fg", "<CMD>Telescope live_grep<CR>", desc = "Live grep" },
    { "<Leader>fb", "<CMD>Telescope buffers<CR>", desc = "Opened buffers" },
    { "<Leader>fh", "<CMD>Telescope help_tags<CR>", desc = "Help page" },
    { "<Leader>fH", "<CMD>Telescope highlights<CR>", desc = "Highlights" },
    { "<Leader>fj", "<CMD>Telescope jumplist<CR>", desc = "Jumplist" },
    { "<Leader>fk", "<CMD>Telescope keymaps<CR>", desc = "Keymaps" },
    { "<Leader>fl", "<CMD>Telescope loclist<CR>", desc = "Loclist" },
    { "<Leader>fo", "<CMD>Telescope oldfiles<CR>", desc = "Oldfiles" },
    { "<Leader>fq", "<CMD>Telescope quickfix<CR>", desc = "Quickfix" },
    { "<Leader><Leader>", "<CMD>Telescope current_buffer_fuzzy_find<CR>", desc = "Find in current buffer" },
    { "<Leader>fm", "<CMD>Telescope man_pages<CR>", desc = "Manpage entries" },
    { "<Leader>fM", "<CMD>Telescope marks<CR>", desc = "Bookmarks" },
    { "<Leader>fu", "<CMD>Telescope undo<CR>", desc = "Undo" },
    { "<Leader>fR", "<CMD>Telescope registers<CR>", desc = "Registers" },
    { "<Leader>fv", "<CMD>Telescope vim_options<CR>", desc = "Vim options" },

    { "<Leader>fC", "<CMD>Telescope git_commits<CR>", desc = "Git commits" },
    { "<Leader>fs", "<CMD>Telescope git_status<CR>", desc = "Git status" },
    { "<Leader>fS", "<CMD>Telescope git_stash<CR>", desc = "Git stash" },
    { "<Leader>fB", "<CMD>Telescope git_branches<CR>", desc = "Git branches" },

    { "<Leader>fi", "<CMD>Nerdy<CR>", desc = "Find icons" },
  },
  config = function()
    local actions = require "telescope.actions"
    local telescope = require "telescope"
    local icons = require("core.icons").telescope

    require("core.utils").setPluginHighlights "telescope"

    telescope.setup {
      defaults = {
        prompt_prefix = icons.Search .. "  ",
        selection_caret = icons.Selected .. " ",
        layout_strategy = "flex",
        -- borderchars = { "═", "║", "═", "║", "╔", "╗", "╝", "╚" }, -- set highlight if border needed
        borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
        layout_config = {
          horizontal = {
            preview_width = 0.50,
          },
          vertical = {
            preview_height = 0.50,
          },
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
