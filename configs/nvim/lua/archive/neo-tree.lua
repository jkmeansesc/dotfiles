local M = {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
  },
  cmd = "Neotree",
}

function M.init()
  local map = require("core.utils").map
  map("n", "<Leader>e", "<CMD>Neotree position=float toggle=true<CR>", { desc = "Toggle Neo-tree" })
end

function M.config()
  local icons = require "core.icons"
  require("neo-tree").setup {
    close_if_last_window = true,
    hide_root_node = true,
    default_component_configs = {
      indent = { padding = 0 },
      icon = {
        folder_closed = icons.Folder,
        folder_open = icons.FolderOpen,
        folder_empty = icons.EmptyFolder,
        folder_empty_open = icons.EmptyFolderOpen,
        default = icons.File,
      },
      modified = { symbol = icons.Dot },
      git_status = {
        symbols = {
          added = icons.GitAdd,
          deleted = icons.GitRemoved,
          modified = icons.GitModified,
          renamed = icons.GitRenamed,
          untracked = icons.GitUntracked,
          ignored = icons.GitIgnored,
          unstaged = icons.GitUnstaged,
          staged = icons.GitStaged,
          conflict = icons.GitConflict,
        },
      },
    },
    commands = {
      parent_or_close = function(state)
        local node = state.tree:get_node()
        if (node.type == "directory" or node:has_children()) and node:is_expanded() then
          state.commands.toggle_node(state)
        else
          require("neo-tree.ui.renderer").focus_node(state, node:get_parent_id())
        end
      end,
      child_or_open = function(state)
        local node = state.tree:get_node()
        if node.type == "directory" or node:has_children() then
          if not node:is_expanded() then -- if unexpanded, expand
            state.commands.toggle_node(state)
          else -- if expanded and has children, seleect the next child
            require("neo-tree.ui.renderer").focus_node(state, node:get_child_ids()[1])
          end
        else -- if not a directory just open it
          state.commands.open(state)
        end
      end,
    },

    window = {
      width = 30,
      mappings = {
        ["<space>"] = false, -- disable space until we figure out which-key disabling
        h = "parent_or_close",
        l = "child_or_open",
      },
    },
    filesystem = {
      follow_current_file = { enabled = true },
      hijack_netrw_behavior = "open_current",
      use_libuv_file_watcher = true,
      filtered_items = {
        visible = true,
      },
    },
    event_handlers = {
      {
        event = "neo_tree_buffer_enter",
        handler = function(_) vim.opt_local.signcolumn = "auto" end,
      },
      {
        event = "neo_tree_window_after_open",
        handler = function(args)
          if args.position == "left" or args.position == "right" then vim.cmd "wincmd =" end
        end,
      },
      {
        event = "neo_tree_window_after_close",
        handler = function(args)
          if args.position == "left" or args.position == "right" then vim.cmd "wincmd =" end
        end,
      },
    },
  }
end
return M
