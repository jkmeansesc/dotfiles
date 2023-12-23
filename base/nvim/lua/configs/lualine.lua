return function()
  local utils = require "core.utils"

  -- show upgradable lazy plugins
  local lazy_status = require "lazy.status"

  -- show copilot status
  local copilotColors = {
    [""] = utils.fg "Special",
    ["Normal"] = utils.fg "Special",
    ["Warning"] = utils.fg "DiagnosticError",
    ["InProgress"] = utils.fg "DiagnosticWarn",
  }

  -- show LSP client
  local stbufnr = function() return vim.api.nvim_win_get_buf(0) end
  local LSP_status = function()
    if rawget(vim, "lsp") then
      for _, client in ipairs(vim.lsp.get_clients()) do
        if client.attached_buffers[stbufnr()] and client.name ~= "null-ls" and client.name ~= "copilot" then
          return (vim.o.columns > 100 and "%#St_LspStatus#" .. "  " .. client.name .. " ") or "  "
        end
      end
    end
  end

  -- set an empty statusline till lualine loads
  -- hide the statusline on the starter page
  vim.g.lualine_laststatus = vim.o.laststatus
  if vim.fn.argc(-1) > 0 then
    vim.o.statusline = " "
  else
    vim.o.laststatus = 0
  end

  -- evil lualine example

  -- Color table for highlights
  local colors = {
    bg = "#202328",
    fg = "#bbc2cf",
    yellow = "#ECBE7B",
    cyan = "#008080",
    darkblue = "#081633",
    green = "#98be65",
    orange = "#FF8800",
    violet = "#a9a1e1",
    magenta = "#c678dd",
    blue = "#51afef",
    red = "#ec5f67",
  }
  local conditions = {
    buffer_not_empty = function() return vim.fn.empty(vim.fn.expand "%:t") ~= 1 end,
    hide_in_width = function() return vim.fn.winwidth(0) > 80 end,
    check_git_workspace = function()
      local filepath = vim.fn.expand "%:p:h"
      local gitdir = vim.fn.finddir(".git", filepath .. ";")
      return gitdir and #gitdir > 0 and #gitdir < #filepath
    end,
  }
  -- Config
  local config = {
    options = {
      -- Disable sections and component separators
      component_separators = "",
      section_separators = "",
      theme = {
        -- We are going to use lualine_c an lualine_x as left and
        -- right section. Both are highlighted by c theme .  So we
        -- are just setting default looks o statusline
        normal = { c = { fg = colors.fg, bg = colors.bg } },
        inactive = { c = { fg = colors.fg, bg = colors.bg } },
      },
    },
    sections = {
      -- these are to remove the defaults
      lualine_a = {},
      lualine_b = {},
      lualine_y = {},
      lualine_z = {},
      -- These will be filled later
      lualine_c = {},
      lualine_x = {},
    },
    inactive_sections = {
      -- these are to remove the defaults
      lualine_a = {},
      lualine_b = {},
      lualine_y = {},
      lualine_z = {},
      lualine_c = {},
      lualine_x = {},
    },
  }

  -- Inserts a component in lualine_c at left section
  local function ins_left(component) table.insert(config.sections.lualine_c, component) end

  -- Inserts a component in lualine_x at right section
  local function ins_right(component) table.insert(config.sections.lualine_x, component) end

  ins_left {
    function() return "▊" end,
    color = { fg = colors.blue }, -- Sets highlighting of component
    padding = { left = 0, right = 1 }, -- We don't need space before this
  }

  ins_left {
    -- mode component
    function() return "" end,
    color = function()
      -- auto change color according to neovims mode
      local mode_color = {
        n = colors.red,
        i = colors.green,
        v = colors.blue,
        [""] = colors.blue,
        V = colors.blue,
        c = colors.magenta,
        no = colors.red,
        s = colors.orange,
        S = colors.orange,
        [""] = colors.orange,
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
    padding = { right = 1 },
  }

  ins_left {
    -- filesize component
    "filesize",
    cond = conditions.buffer_not_empty,
  }

  ins_left {
    "filename",
    cond = conditions.buffer_not_empty,
    color = { fg = colors.magenta, gui = "bold" },
  }

  ins_left { "location" }

  ins_left { "progress", color = { fg = colors.fg, gui = "bold" } }

  ins_left {
    "diagnostics",
    sources = { "nvim_diagnostic" },
    symbols = { error = " ", warn = " ", info = " " },
    diagnostics_color = {
      color_error = { fg = colors.red },
      color_warn = { fg = colors.yellow },
      color_info = { fg = colors.cyan },
    },
  }

  -- Insert mid section. You can make any number of sections in neovim :)
  -- for lualine it's any number greater then 2
  ins_left {
    function() return "%=" end,
  }

  ins_left {
    -- Lsp server name .
    function()
      local msg = "No Active Lsp"
      local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
      local clients = vim.lsp.get_active_clients()
      if next(clients) == nil then return msg end
      for _, client in ipairs(clients) do
        local filetypes = client.config.filetypes
        if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then return client.name end
      end
      return msg
    end,
    icon = "  LSP:",
    color = { fg = "#ffffff", gui = "bold" },
  }

  -- Add components to right sections
  ins_right {
    "o:encoding", -- option component same as &encoding in viml
    fmt = string.upper, -- I'm not sure why it's upper case either ;)
    cond = conditions.hide_in_width,
    color = { fg = colors.green, gui = "bold" },
  }

  ins_right {
    "fileformat",
    fmt = string.upper,
    icons_enabled = false, -- I think icons are cool but Eviline doesn't have them. sigh
    color = { fg = colors.green, gui = "bold" },
  }

  ins_right {
    "branch",
    icon = "",
    color = { fg = colors.violet, gui = "bold" },
  }

  ins_right {
    "diff",
    -- Is it me or the symbol for modified us really weird
    symbols = { added = " ", modified = "󰝤 ", removed = " " },
    diff_color = {
      added = { fg = colors.green },
      modified = { fg = colors.orange },
      removed = { fg = colors.red },
    },
    cond = conditions.hide_in_width,
  }

  ins_right {
    function() return "▊" end,
    color = { fg = colors.blue },
    padding = { left = 1 },
  }

  require("lualine").setup(config)
  -- require("lualine").setup {
  --   extensions = { "quickfix", "lazy", "mason", "nvim-dap-ui", "neo-tree", "toggleterm", "quickfix" },
  --   options = {
  --     theme = "auto",
  --     globalstatus = true,
  --   },
  --   sections = {
  --     lualine_c = { "filename", LSP_status },
  --     lualine_x = {
  --       -- for lazy status
  --       {
  --         lazy_status.updates,
  --         cond = lazy_status.has_updates,
  --         color = { fg = "#ff9e64" },
  --       },
  --       -- for copilot
  --       {
  --         function()
  --           local status = require("copilot.api").status.data
  --           return " " .. (status.message or "")
  --         end,
  --         cond = function()
  --           if not package.loaded["copilot"] then return end
  --           local ok, clients = pcall(utils.get_clients, { name = "copilot", bufnr = 0 })
  --           if not ok then return false end
  --           return ok and #clients > 0
  --         end,
  --         color = function()
  --           if not package.loaded["copilot"] then return end
  --           local status = require("copilot.api").status.data
  --           return copilotColors[status.status] or copilotColors[""]
  --         end,
  --       },
  --       { "encoding" },
  --       { "filetype" },
  --     },
  --   },
  -- }
end
