local M = {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "AndreM222/copilot-lualine",
  },
  event = "VeryLazy",
}
-- colors for highlights
local colors = {
  bg = "#202328",
  fg = "#BBC2CF",
  yellow = "#F9E2AF",
  cyan = "#74C7EC",
  green = "#A6E3A1",
  orange = "#FAB387",
  violet = "#B4BEFE",
  magenta = "#C678DD",
  blue = "#89B4FA",
  red = "#F38BA8",
}

local icons = require "core.icons"

function M.config()
  -- set an empty statusline till lualine loads
  -- hide the statusline on the starter page
  vim.g.lualine_laststatus = vim.o.laststatus
  if vim.fn.argc(-1) > 0 then
    vim.o.statusline = " "
  else
    vim.o.laststatus = 0
  end

  -- lsp client
  local LSP_status = function()
    local clients = vim.lsp.get_clients()
    local msg = "No Active Lsp"
    if next(clients) == nil then return msg end
    if rawget(vim, "lsp") then
      for _, client in ipairs(vim.lsp.get_clients()) do
        if
          client.attached_buffers[vim.api.nvim_win_get_buf(0)]
          and client.name ~= "null-ls"
          and client.name ~= "copilot"
        then
          return client.name
        else
          return msg
        end
      end
    end
  end

  -- lazy status
  local lazy_status = require "lazy.status"
  local lazy = function() return lazy_status.updates() end

  -- conditions for components to show
  local conditions = {
    buffer_not_empty = function() return vim.fn.empty(vim.fn.expand "%:t") ~= 1 end,
    hide_in_width = function() return vim.fn.winwidth(0) > 80 end,
    lazy_status = lazy_status.has_updates,
    is_copilot = function()
      local utils = require "core.utils"
      if not package.loaded["copilot"] then return end
      local ok, clients = pcall(utils.get_clients, { name = "copilot", bufnr = 0 })
      if not ok then return false end
      return ok and #clients > 0
    end,
  }

  -- noice
  local noice = require("noice").api.statusline.mode

  require("lualine").setup {
    extensions = { "quickfix", "lazy", "mason", "nvim-dap-ui", "toggleterm", "quickfix" },
    options = {
      theme = "auto",
      globalstatus = true,
      component_separators = "",
      section_separators = "",
    },
    sections = {
      lualine_a = {},
      lualine_b = { { "mode", color = { gui = "bold" } } },
      lualine_c = {
        {
          "branch",
          color = { fg = "#ffffff", gui = "bold" },
        },
        {
          "diff",
          cond = conditions.hide_in_width,
          symbols = {
            added = icons.GitAdd .. " ",
            modified = icons.GitModified .. " ",
            removed = icons.GitRemoved .. " ",
          },
          diff_color = {
            added = { fg = colors.green },
            modified = { fg = colors.orange },
            removed = { fg = colors.red },
          },
        },
        {
          lazy,
          cond = conditions.lazy_status,
          color = { fg = colors.orange },
        },
        {
          "copilot",
          cond = conditions.is_copilot,
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
                enabled = "#50FA7B",
                sleep = "#AEB7D0",
                disabled = "#6272A4",
                warning = "#FFB86C",
                unknown = "#FF5555",
              },
            },
            spinners = require("copilot-lualine.spinners").dots,
            spinner_color = "#6272A4",
          },
          show_colors = true,
          show_loading = true,
        },
        {
          noice.get,
          cond = noice.has,
          color = { fg = colors.orange },
        },
        { function() return "%=" end },
        {
          LSP_status,
          icon = icons.Lsp .. "  LSP:",
          color = { fg = "#ffffff", gui = "bold" },
        },
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
            color_error = { fg = colors.red },
            color_warn = { fg = colors.yellow },
            color_info = { fg = colors.cyan },
          },
        },
      },
      lualine_x = {
        {
          "filename",
          cond = conditions.buffer_not_empty,
          color = function()
            -- auto change color according to neovims mode
            local mode_color = {
              n = colors.red,
              i = colors.green,
              v = colors.blue,
              V = colors.blue,
              c = colors.magenta,
              no = colors.red,
              s = colors.orange,
              S = colors.orange,
              [""] = colors.orange,
              ic = colors.yellow,
              R = colors.violet,
              Rv = colors.violet,
              cv = colors.red,
              ce = colors.red,
              r = colors.cyan,
              rm = colors.cyan,
              ["r?"] = colors.cyan,
              ["!"] = colors.red,
              t = colors.red,
            }
            return { fg = mode_color[vim.fn.mode()] }
          end,
        },
        {
          "filetype",
          color = { fg = colors.fg, gui = "bold" },
        },
        {
          "encoding",
          fmt = string.upper,
          cond = conditions.hide_in_width,
          color = { fg = colors.fg, gui = "bold" },
        },
      },
      lualine_y = { { "progress", color = { gui = "bold" } } },
      lualine_z = {},
    },
  }
end

return M
