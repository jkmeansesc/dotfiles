return {
  "nvim-tree/nvim-tree.lua",
  keys = {
    { "<Leader>e", "<CMD>NvimTreeFocus<CR>", desc = "Nvim-tree Toggle" },
  },
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local api = require "nvim-tree.api"
    local icons = require "core.icons"
    local HEIGHT_RATIO = 0.8
    local WIDTH_RATIO = 0.6

    -- ╭──────────────────────────────────────────────────────────╮
    -- │automatically open file upon creation                     │
    -- ╰──────────────────────────────────────────────────────────╯
    api.events.subscribe(api.events.Event.FileCreated, function(file) vim.cmd("edit " .. file.fname) end)

    -- ╭──────────────────────────────────────────────────────────╮
    -- │stage and unstage files directly in the tree view         │
    -- ╰──────────────────────────────────────────────────────────╯
    local git_add = function()
      local node = api.tree.get_node_under_cursor()
      local gs = node.git_status.file
      -- If the current node is a directory get children status
      if gs == nil then
        gs = (node.git_status.dir.direct ~= nil and node.git_status.dir.direct[1])
          or (node.git_status.dir.indirect ~= nil and node.git_status.dir.indirect[1])
      end
      -- If the file is untracked, unstaged or partially staged, we stage it
      if gs == "??" or gs == "MM" or gs == "AM" or gs == " M" then
        vim.cmd("silent !git add " .. node.absolute_path)
      -- If the file is staged, we unstage
      elseif gs == "M " or gs == "A " then
        vim.cmd("silent !git restore --staged " .. node.absolute_path)
      end
      api.tree.reload()
    end

    -- ╭──────────────────────────────────────────────────────────╮
    -- │on_attach mappings                                        │
    -- ╰──────────────────────────────────────────────────────────╯
    local function on_attach(bufnr)
      local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
      end
      api.config.mappings.default_on_attach(bufnr)
      vim.keymap.set("n", "l", api.node.open.edit, opts "Open")
      vim.keymap.set("n", "L", api.tree.expand_all, opts "Expand All")
      vim.keymap.set("n", "h", api.node.navigate.parent_close, opts "Close Directory")
      vim.keymap.set("n", "H", api.tree.collapse_all, opts "Collapse All")
      vim.keymap.set("n", "ga", git_add, opts "Git Add")
    end

    require("nvim-tree").setup {
      on_attach = on_attach,
      renderer = {
        root_folder_label = false,
        highlight_git = true,
        highlight_opened_files = "none",
        icons = {
          git_placement = "signcolumn",
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

      -- ╭──────────────────────────────────────────────────────────╮
      -- │center a floating nvim-tree window                        │
      -- ╰──────────────────────────────────────────────────────────╯
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
  end,
}
