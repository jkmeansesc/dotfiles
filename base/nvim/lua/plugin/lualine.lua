return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "AndreM222/copilot-lualine",
  },
  config = function()
    local color = require("core.highlights").palette.catppuccin
    local icons = require("core.icons").lualine

    local theme = function()
      return {
        inactive = {
          a = { fg = color.text, bg = color.outerbg, gui = "bold" },
          b = { fg = color.text, bg = color.outerbg },
          c = { fg = color.text, bg = color.innerbg },
        },
        visual = {
          a = { fg = color.mantle, bg = color.peach, gui = "bold" },
          b = { fg = color.peach, bg = color.outerbg },
          c = { fg = color.text, bg = color.innerbg },
        },
        replace = {
          a = { fg = color.mantle, bg = color.red, gui = "bold" },
          b = { fg = color.red, bg = color.outerbg },
          c = { fg = color.text, bg = color.innerbg },
        },
        normal = {
          a = { fg = color.mantle, bg = color.pink, gui = "bold" },
          b = { fg = color.pink, bg = color.outerbg },
          c = { fg = color.text, bg = color.innerbg },
        },
        insert = {
          a = { fg = color.mantle, bg = color.green, gui = "bold" },
          b = { fg = color.green, bg = color.outerbg },
          c = { fg = color.text, bg = color.innerbg },
        },
        command = {
          a = { fg = color.mantle, bg = color.yellow, gui = "bold" },
          b = { fg = color.yellow, bg = color.outerbg },
          c = { fg = color.text, bg = color.innerbg },
        },
      }
    end

    -- set an empty statusline till lualine loads
    -- hide the statusline on the starter page
    vim.g.lualine_laststatus = vim.o.laststatus
    if vim.fn.argc(-1) > 0 then
      vim.o.statusline = " "
    else
      vim.o.laststatus = 0
    end

    -- lsp client
    local lsp = function()
      local clients = vim.lsp.get_clients()
      local msg = "No Active Lsp"
      if next(clients) == nil then
        return msg
      else
        local c = {}
        for _, client in ipairs(clients) do
          if client.name ~= "null-ls" and client.name ~= "copilot" then table.insert(c, client.name) end
        end
        if next(c) == nil then
          return msg
        else
          return table.concat(c, "|")
        end
      end
    end

    -- lazy status
    local lazy_status = require "lazy.status"
    local lazy = function() return lazy_status.updates() end

    -- vim
    local vim_icon = function() return "" end

    -- conditions for components to show
    local conditions = {
      buffer_not_empty = function() return vim.fn.empty(vim.fn.expand "%:t") ~= 1 end,
      hide_in_width = function() return vim.fn.winwidth(0) > 80 end,
      lazy_status = lazy_status.has_updates,
    }

    require("lualine").setup {
      disabled_filetypes = {
        statusline = { "alpha" },
        winbar = { "alpha", "edgy", "toggleterm", "Trouble", "spectre_panel", "qf", "noice", "dbui" },
      },
      options = {
        theme = theme,
        globalstatus = true,
        section_separators = { left = "", right = "" },
        component_separators = { left = "", right = "" },
      },
      sections = {
        lualine_a = {
          {
            vim_icon,
            color = { gui = "bold" },
          },
        },
        lualine_b = {
          {
            "branch",
            color = { gui = "bold" },
          },
        },
        lualine_c = {
          {
            "diff",
            cond = conditions.hide_in_width,
            symbols = {
              added = icons.GitAdd .. " ",
              modified = icons.GitModified .. " ",
              removed = icons.GitRemoved .. " ",
            },
            diff_color = {
              added = { fg = color.green },
              modified = { fg = color.peach },
              removed = { fg = color.red },
            },
          },
          { function() return "%=" end },
          {
            "diagnostics",
            sources = { "nvim_diagnostic" },
            symbols = {
              error = icons.DiagnosticError .. " ",
              warn = icons.DiagnosticWarn .. " ",
              info = icons.DiagnosticInfo .. " ",
              hint = icons.DiagnosticHint .. " ",
            },
            diagnostics_color = {
              color_error = { fg = color.red },
              color_warn = { fg = color.yellow },
              color_info = { fg = color.green },
              color_hint = { fg = color.blue },
            },
          },
        },
        lualine_x = {
          {
            lazy,
            cond = conditions.lazy_status,
            color = { fg = color.peach },
          },
          {
            "copilot",
            symbols = {
              status = {
                icons = {
                  enabled = icons.CopilotEnabled,
                  sleep = icons.CopilotEnabled,
                  disabled = icons.CopilotDisabled,
                  warning = icons.CopilotWarning,
                  unknown = icons.CopilotUnknown,
                },
                hl = {
                  enabled = color.green,
                  sleep = color.teal,
                  disabled = color.yellow,
                  warning = color.peach,
                  unknown = color.red,
                },
              },
              spinners = require("copilot-lualine.spinners").dots,
              spinner_color = color.yellow,
            },
            show_colors = true,
            show_loading = true,
          },
          {
            "encoding",
            fmt = string.upper,
            cond = conditions.hide_in_width,
            color = { gui = "bold" },
          },
        },
        lualine_y = {
          {
            lsp,
            icon = icons.Lsp .. " ",
            color = { gui = "bold" },
          },
        },
        lualine_z = {
          {
            "progress",
            color = { gui = "bold" },
          },
        },
      },
    }
  end,
}
