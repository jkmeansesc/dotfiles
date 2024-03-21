local M = {
  "nvim-tree/nvim-tree.lua",
  cmd = { "NvimTreeToggle", "NvimTreeFocus" },
  dependencies = { "nvim-tree/nvim-web-devicons" },
}

function M.init()
  local map = require("core.utils").map
  map("n", "<Leader>e", ":NvimTreeFocus<CR>", { desc = "Nvim-tree Toggle" })
end

function M.config()
  local api = require "nvim-tree.api"
  local icons = require "core.icons"

  -- h&l operation
  local function on_attach(bufnr)
    local function opts(desc)
      return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end
    api.config.mappings.default_on_attach(bufnr)
    vim.keymap.set("n", "l", api.node.open.edit, opts "Open")
    vim.keymap.set("n", "h", api.node.navigate.parent_close, opts "Close Directory")
    vim.keymap.set("n", "H", api.tree.collapse_all, opts "Collapse All")
  end

  -- automatically open file upon creation
  api.events.subscribe(api.events.Event.FileCreated, function(file) vim.cmd("edit " .. file.fname) end)

  local HEIGHT_RATIO = 0.8
  local WIDTH_RATIO = 0.6

  require("nvim-tree").setup {
    on_attach = on_attach,
    renderer = {
      root_folder_label = false,
      highlight_git = true,
      highlight_opened_files = "none",
      icons = {
        git_placement = "after",
        padding = " ",
        symlink_arrow = " ➛ ",
        glyphs = {
          default = icons.Text,
          symlink = icons.FileSymlink,
          bookmark = icons.BookMark,
          folder = {
            arrow_closed = icons.ChevronRight,
            arrow_open = icons.ChevronShortDown,
            default = icons.Folder,
            open = icons.FolderOpen,
            empty = icons.EmptyFolder,
            empty_open = icons.EmptyFolderOpen,
            symlink = icons.FolderSymlink,
            symlink_open = icons.FolderOpen,
          },
          git = {
            unstaged = icons.GitUnstaged,
            staged = icons.GitStaged,
            unmerged = icons.GitUnmerged,
            renamed = icons.GitRenamed,
            untracked = icons.GitUntracked,
            deleted = icons.GitRemoved,
            ignored = icons.GitIgnored,
          },
        },
      },
      special_files = { "Makefile", "README.md", "readme.md" },
    },

    -- center a floating nvim-tree window
    view = {
      float = {
        enable = true,
        open_win_config = function()
          local screen_w = vim.opt.columns:get()
          ---@diagnostic disable-next-line: undefined-field
          local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
          local window_w = screen_w * WIDTH_RATIO
          local window_h = screen_h * HEIGHT_RATIO
          local window_w_int = math.floor(window_w)
          local window_h_int = math.floor(window_h)
          local center_x = (screen_w - window_w) / 2
          ---@diagnostic disable-next-line: undefined-field
          local center_y = ((vim.opt.lines:get() - window_h) / 2) - vim.opt.cmdheight:get()
          return {
            border = "rounded",
            relative = "editor",
            row = center_y,
            col = center_x,
            width = window_w_int,
            height = window_h_int,
          }
        end,
      },
      width = function() return math.floor(vim.opt.columns:get() * WIDTH_RATIO) end,
    },

    filesystem_watchers = {
      ignore_dirs = {
        "node_modules",
      },
    },

    filters = {
      custom = { "^.git$" }, -- hide .git folder
      git_ignored = false, -- don't hide git ignored files
    },
  }
end

return M
