return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = "VeryLazy",
  config = function()
    local utils = require "core.utils"

    -- show upgradable lazy plugins
    local lazy_status = require "lazy.status"

    -- show copilot status
    local colors = {
      [""] = utils.fg "Special",
      ["Normal"] = utils.fg "Special",
      ["Warning"] = utils.fg "DiagnosticError",
      ["InProgress"] = utils.fg "DiagnosticWarn",
    }

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
      options = {
        theme = "auto",
        globalstatus = true,
      },
      sections = {
        lualine_c = { "filename", { LSP_status } },
        lualine_x = {
          -- for lazy status
          {
            lazy_status.updates,
            cond = lazy_status.has_updates,
            color = { fg = "#ff9e64" },
          },
          -- for copilot
          {
            function()
              local status = require("copilot.api").status.data
              return " " .. (status.message or "")
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
          { "encoding" },
          { "filetype" },
        },
      },
    }
  end,
}
