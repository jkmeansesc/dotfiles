local M = {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    {
      "rcarriga/nvim-notify",
      opts = {
        -- background_colour = "#000000",
      },
    },
  },
}

function M.config()
  local icons = require "core.icons"
  require("noice").setup {
    lsp = {
      -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
      },
    },
    routes = {
      {
        filter = {
          event = "msg_show",
          any = {
            { find = "%d+L, %d+B" },
            { find = "; after #%d+" },
            { find = "; before #%d+" },
            { find = "%d fewer lines" },
            { find = "%d more lines" },
            { kind = "search_count" },
            { kind = "", find = "written" },
            { find = "^%d+ lines yanked$" },
          },
        },
        opts = { skip = true },
      },
    },

    presets = {
      bottom_search = true, -- use a classic bottom cmdline for search
      command_palette = false, -- position the cmdline and popupmenu together
      long_message_to_split = true, -- long messages will be sent to a split
      inc_rename = true, -- enables an input dialog for inc-rename.nvim
      lsp_doc_border = false, -- add a border to hover docs and signature help
    },

    cmdline = {
      view = "cmdline",
      format = {
        cmdline = { pattern = "^:", icon = icons.Command, lang = "vim" },
        search_down = {
          kind = "search",
          pattern = "^/",
          icon = icons.Search .. " " .. icons.Down,
          lang = "regex",
        },
        search_up = { kind = "search", pattern = "^%?", icon = icons.Search .. " " .. icons.Up, lang = "regex" },
        filter = { pattern = "^:%s*!", icon = "$", lang = "bash" },
        lua = { pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" }, icon = icons.Lua, lang = "lua" },
        help = { pattern = "^:%s*he?l?p?%s+", icon = icons.Question },
      },
    },
  }
end
return M
