local M = {
  "nvim-telescope/telescope.nvim",
  version = false,
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "debugloop/telescope-undo.nvim",
    "nvim-telescope/telescope-ui-select.nvim",
    { "2kabhishek/nerdy.nvim", cmd = "Nerdy" },
    { "nvim-telescope/telescope-fzf-native.nvim", enabled = vim.fn.executable "make" == 1, build = "make" },
  },
  cmd = "Telescope",
  init = function() require("core.utils").load_mappings "telescope" end,
}

function M.config()
  local actions = require "telescope.actions"
  local Layout = require "nui.layout"
  local Popup = require "nui.popup"
  local telescope = require "telescope"
  local TSLayout = require "telescope.pickers.layout"
  local trouble = require "trouble.providers.telescope"
  local function make_popup(options)
    local popup = Popup(options)
    function popup.border:change_title(title) popup.border.set_text(popup.border, "top", title) end
    return TSLayout.Window(popup)
  end
  telescope.setup {
    defaults = {
      git_worktrees = vim.g.git_worktrees,
      prompt_prefix = "   ",
      layout_strategy = "flex",
      layout_config = {
        horizontal = {
          size = {
            width = "90%",
            height = "80%",
          },
        },
        vertical = {
          size = {
            width = "90%",
            height = "90%",
          },
        },
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
          ["<C-e>"] = actions.close, -- close telescope
          ["<C-n>"] = actions.cycle_history_next, -- cycle previewer next
          ["<C-p>"] = actions.cycle_history_prev, -- cycle previewer prev
          ["<C-t>"] = trouble.open_with_trouble,
        },
        n = {
          ["q"] = actions.close, -- close telescope
          ["<C-t>"] = trouble.open_with_trouble,
        },
      },

      create_layout = function(picker)
        local border = {
          results = {
            top_left = "┌",
            top = "─",
            top_right = "┬",
            right = "│",
            bottom_right = "",
            bottom = "",
            bottom_left = "",
            left = "│",
          },
          results_patch = {
            minimal = {
              top_left = "┌",
              top_right = "┐",
            },
            horizontal = {
              top_left = "┌",
              top_right = "┬",
            },
            vertical = {
              top_left = "├",
              top_right = "┤",
            },
          },
          prompt = {
            top_left = "├",
            top = "─",
            top_right = "┤",
            right = "│",
            bottom_right = "┘",
            bottom = "─",
            bottom_left = "└",
            left = "│",
          },
          prompt_patch = {
            minimal = {
              bottom_right = "┘",
            },
            horizontal = {
              bottom_right = "┴",
            },
            vertical = {
              bottom_right = "┘",
            },
          },
          preview = {
            top_left = "┌",
            top = "─",
            top_right = "┐",
            right = "│",
            bottom_right = "┘",
            bottom = "─",
            bottom_left = "└",
            left = "│",
          },
          preview_patch = {
            minimal = {},
            horizontal = {
              bottom = "─",
              bottom_left = "",
              bottom_right = "┘",
              left = "",
              top_left = "",
            },
            vertical = {
              bottom = "",
              bottom_left = "",
              bottom_right = "",
              left = "│",
              top_left = "┌",
            },
          },
        }

        local results = make_popup {
          focusable = false,
          border = {
            style = border.results,
            text = {
              top = picker.results_title,
              top_align = "center",
            },
          },
          win_options = {
            winhighlight = "Normal:Normal",
          },
        }

        local prompt = make_popup {
          enter = true,
          border = {
            style = border.prompt,
            text = {
              top = picker.prompt_title,
              top_align = "center",
            },
          },
          win_options = {
            winhighlight = "Normal:Normal",
          },
        }

        local preview = make_popup {
          focusable = false,
          border = {
            style = border.preview,
            text = {
              top = picker.preview_title,
              top_align = "center",
            },
          },
        }

        local box_by_kind = {
          vertical = Layout.Box({
            Layout.Box(preview, { grow = 1 }),
            Layout.Box(results, { grow = 1 }),
            Layout.Box(prompt, { size = 3 }),
          }, { dir = "col" }),
          horizontal = Layout.Box({
            Layout.Box({
              Layout.Box(results, { grow = 1 }),
              Layout.Box(prompt, { size = 3 }),
            }, { dir = "col", size = "50%" }),
            Layout.Box(preview, { size = "50%" }),
          }, { dir = "row" }),
          minimal = Layout.Box({
            Layout.Box(results, { grow = 1 }),
            Layout.Box(prompt, { size = 3 }),
          }, { dir = "col" }),
        }

        local function get_box()
          local strategy = picker.layout_strategy
          if strategy == "vertical" or strategy == "horizontal" then return box_by_kind[strategy], strategy end

          local height, width = vim.o.lines, vim.o.columns
          local box_kind = "horizontal"
          if width < 100 then
            box_kind = "vertical"
            if height < 40 then box_kind = "minimal" end
          end
          return box_by_kind[box_kind], box_kind
        end

        local function prepare_layout_parts(layout, box_type)
          layout.results = results
          results.border:set_style(border.results_patch[box_type])

          layout.prompt = prompt
          prompt.border:set_style(border.prompt_patch[box_type])

          if box_type == "minimal" then
            layout.preview = nil
          else
            layout.preview = preview
            preview.border:set_style(border.preview_patch[box_type])
          end
        end

        local function get_layout_size(box_kind)
          return picker.layout_config[box_kind == "minimal" and "vertical" or box_kind].size
        end

        local box, box_kind = get_box()
        local layout = Layout({
          relative = "editor",
          position = "50%",
          size = get_layout_size(box_kind),
        }, box)

        layout.picker = picker
        prepare_layout_parts(layout, box_kind)

        local layout_update = layout.update
        function layout:update()
          local boxx, boxkind = get_box()
          prepare_layout_parts(layout, boxkind)
          layout_update(self, { size = get_layout_size(boxkind) }, boxx)
        end

        return TSLayout(layout)
      end,
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
end

return M
