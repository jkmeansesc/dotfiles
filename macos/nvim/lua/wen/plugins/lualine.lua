return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = "VeryLazy",
  config = function()
    local lazy_status = require "lazy.status"

    local utils = require "wen.core.utils"
    local colors = {
      [""] = utils.fg "Special",
      ["Normal"] = utils.fg "Special",
      ["Warning"] = utils.fg "DiagnosticError",
      ["InProgress"] = utils.fg "DiagnosticWarn",
    }

    vim.g.lualine_laststatus = vim.o.laststatus
    if vim.fn.argc(-1) > 0 then
      -- set an empty statusline till lualine loads
      vim.o.statusline = " "
    else
      -- hide the statusline on the starter page
      vim.o.laststatus = 0
    end

    require("lualine").setup {
      extensions = { "quickfix", "lazy", "mason", "nvim-dap-ui", "neo-tree", "toggleterm", "trouble" },
      options = { theme = "ayu_mirage" },
      sections = {
        -- for copilot
        lualine_c = {
          { "filename" },
          {
            function()
              local status = require("copilot.api").status.data
              return "" .. (status.message or "")
            end,
            cond = function()
              if not package.loaded["copilot"] then return end
              local ok, clients = pcall(utils.get_clients, { name = "copilot", bufnr = 0 })
              if not ok then return false end
              return ok and #clients > 0
            end,
            color = function()
              if not package.loaded["copilot"] then return end
              local status = require("copilot.api").status.data
              return colors[status.status] or colors[""]
            end,
          },
        },
        lualine_x = {
          {
            lazy_status.updates,
            cond = lazy_status.has_updates,
            color = { fg = "#ff9e64" },
          },
          { "encoding" },
          { "fileformat" },
          { "filetype" },
        },
      },
    }
  end,
}
