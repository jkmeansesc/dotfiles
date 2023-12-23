return function()
  local telescope = require "telescope"
  local actions = require "telescope.actions"

  -- local colors = require("catppuccin.palettes").get_palette()
  -- local TelescopeColor = {
  --   TelescopeMatching = { fg = colors.flamingo },
  --   TelescopeSelection = { fg = colors.text, bg = colors.surface0, bold = true },
  --
  --   TelescopePromptPrefix = { bg = colors.surface0 },
  --   TelescopePromptNormal = { bg = colors.surface0 },
  --   TelescopeResultsNormal = { bg = colors.mantle },
  --   TelescopePreviewNormal = { bg = colors.mantle },
  --   TelescopePromptBorder = { bg = colors.surface0, fg = colors.surface0 },
  --   TelescopeResultsBorder = { bg = colors.mantle, fg = colors.mantle },
  --   TelescopePreviewBorder = { bg = colors.mantle, fg = colors.mantle },
  --   TelescopePromptTitle = { bg = colors.pink, fg = colors.mantle },
  --   TelescopeResultsTitle = { bg = colors.red, fg = colors.mantle },
  --   TelescopePreviewTitle = { bg = colors.green, fg = colors.mantle },
  -- }

  -- for hl, col in pairs(TelescopeColor) do
  --   vim.api.nvim_set_hl(0, hl, col)
  -- end

  telescope.setup {
    defaults = {
      git_worktrees = vim.g.git_worktrees,
      prompt_prefix = "   ",
      layout_config = {
        horizontal = { prompt_position = "bottom", preview_width = 0.70 },
        vertical = { mirror = false },
        width = 0.90,
        height = 0.80,
        preview_cutoff = 120,
      },
      winblend = 0,
      color_devicons = true,

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
      set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
      mappings = {
        i = {
          ["<C-k>"] = actions.move_selection_previous, -- move to prev result
          ["<C-j>"] = actions.move_selection_next, -- move to next result
          ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
          ["<C-c>"] = actions.close, -- close telescope
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
end
