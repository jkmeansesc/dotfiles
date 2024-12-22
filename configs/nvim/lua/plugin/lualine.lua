return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "AndreM222/copilot-lualine",
  },
  config = function()
    local c = require "core.colors"
    local icons = require("core.icons").lualine

    local theme = function()
      return {
        inactive = {
          a = { fg = c.text, bg = nil, gui = "bold" },
          b = { fg = c.text, bg = nil },
          c = { fg = c.text, bg = nil },
        },
        visual = {
          a = { fg = c.mantle, bg = c.peach, gui = "bold" },
          b = { fg = c.peach, bg = nil },
          c = { fg = c.text, bg = nil },
        },
        replace = {
          a = { fg = c.mantle, bg = c.maroon, gui = "bold" },
          b = { fg = c.maroon, bg = nil },
          c = { fg = c.text, bg = nil },
        },
        normal = {
          a = { fg = c.mantle, bg = c.red, gui = "bold" },
          b = { fg = c.red, bg = nil },
          c = { fg = c.text, bg = nil },
        },
        insert = {
          a = { fg = c.mantle, bg = c.green, gui = "bold" },
          b = { fg = c.green, bg = nil },
          c = { fg = c.text, bg = nil },
        },
        command = {
          a = { fg = c.mantle, bg = c.yellow, gui = "bold" },
          b = { fg = c.yellow, bg = nil },
          c = { fg = c.text, bg = nil },
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
              added = { fg = c.green },
              modified = { fg = c.peach },
              removed = { fg = c.red },
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
              color_error = { fg = c.red },
              color_warn = { fg = c.yellow },
              color_info = { fg = c.green },
              color_hint = { fg = c.blue },
            },
          },
        },
        lualine_x = {
          {
            lazy,
            cond = conditions.lazy_status,
            color = { fg = c.peach },
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
                  enabled = c.green,
                  sleep = c.teal,
                  disabled = c.yellow,
                  warning = c.peach,
                  unknown = c.red,
                },
              },
              spinners = require("copilot-lualine.spinners").dots,
              spinner_color = c.yellow,
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
