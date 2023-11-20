return {
  {
    "nvim-telescope/telescope.nvim",
    -- branch = "0.1.x",
    version = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "nvim-telescope/telescope-ui-select.nvim",
      "debugloop/telescope-undo.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", enabled = vim.fn.executable "make" == 1, build = "make" },
    },
    cmd = "Telescope",
    init = function() require("wen.core.utils").load_mappings "telescope" end,
    config = function()
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
      --   TelescopeResultsTitle = { fg = colors.mantle },
      --   TelescopePreviewTitle = { bg = colors.green, fg = colors.mantle },
      -- }
      --
      -- for hl, col in pairs(TelescopeColor) do
      --   vim.api.nvim_set_hl(0, hl, col)
      -- end

      -- -- -- boarderless
      -- local TelescopePrompt = {
      --   TelescopePromptNormal = {
      --     bg = "#2d3149",
      --   },
      --   TelescopePromptBorder = {
      --     bg = "#2d3149",
      --   },
      --   TelescopePromptTitle = {
      --     fg = "#2d3149",
      --     bg = "#2d3149",
      --   },
      --   TelescopePreviewTitle = {
      --     fg = "#1F2335",
      --     bg = "#1F2335",
      --   },
      --   TelescopeResultsTitle = {
      --     fg = "#1F2335",
      --     bg = "#1F2335",
      --   },
      -- }
      -- for hl, col in pairs(TelescopePrompt) do
      --   vim.api.nvim_set_hl(0, hl, col)
      -- end
      -- -- -- boarderless end

      telescope.setup {
        defaults = {
          git_worktrees = vim.g.git_worktrees,
          prompt_prefix = "   ",
          selection_caret = "  ",
          entry_prefix = "  ",
          -- layout_strategy = "horizontal",
          layout_strategy = "flex",
          layout_config = {
            width = 0.85,
            preview_cutoff = 120,
            horizontal = {
              preview_width = function(_, cols, _)
                if cols < 120 then return math.floor(cols * 0.5) end
                return math.floor(cols * 0.6)
              end,
              mirror = false,
            },
            vertical = { mirror = false },
          },
          -- layout_config = {
          --   horizontal = {
          --     prompt_position = "top",
          --     preview_width = 0.55,
          --     results_width = 0.8,
          --   },
          --   vertical = {
          --     mirror = false,
          --   },
          --   width = 0.87,
          --   height = 0.80,
          --   preview_cutoff = 120,
          -- },
          -- winblend = 0,
          -- border = {},
          -- borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
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
      telescope.load_extension "ui-select" --sets vim.ui.select to telescope, like lua vim.lsp.buf.code_action()
      telescope.load_extension "undo"
    end,
  },
}
