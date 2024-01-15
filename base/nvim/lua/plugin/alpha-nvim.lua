local M = {
  "goolord/alpha-nvim",
  event = "VimEnter",
}

function M.config()
  local dashboard = require "alpha.themes.dashboard"
  local logo = [[
                  ████ ██████           █████      ██
                 ███████████             █████ 
                 █████████ ███████████████████ ███   ███████████
                █████████  ███    █████████████ █████ ██████████████
               █████████ ██████████ █████████ █████ █████ ████ █████
             ███████████ ███    ███ █████████ █████ █████ ████ █████
            ██████  █████████████████████ ████ █████ █████ ████ ██████
        ]]

  dashboard.section.header.val = vim.split(logo, "\n")
    -- stylua: ignore
    dashboard.section.buttons.val = {
      dashboard.button("f", " " .. " Find file", "<cmd> Telescope find_files <cr>"),
      dashboard.button("n", " " .. " New file", "<cmd> ene <BAR> startinsert <cr>"),
      dashboard.button("r", " " .. " Recent files", "<cmd> Telescope oldfiles <cr>"),
      dashboard.button("g", " " .. " Find text", "<cmd> Telescope live_grep <cr>"),
      dashboard.button("l", "󰒲 " .. " Lazy", "<cmd> Lazy <cr>"),
      dashboard.button("q", " " .. " Quit", "<cmd> qa <cr>"),
    }
  for _, button in ipairs(dashboard.section.buttons.val) do
    button.opts.hl = "AlphaButtons"
    button.opts.hl_shortcut = "AlphaShortcut"
  end
  dashboard.section.header.opts.hl = "AlphaHeader"
  dashboard.section.buttons.opts.hl = "AlphaButtons"
  dashboard.section.footer.opts.hl = "AlphaFooter"
  dashboard.opts.layout[1].val = 8

  -- close Lazy and re-open when the dashboard is ready
  if vim.o.filetype == "lazy" then
    vim.cmd.close()
    vim.api.nvim_create_autocmd("User", {
      once = true,
      pattern = "AlphaReady",
      callback = function() require("lazy").show() end,
    })
  end

  -- display loading time
  vim.api.nvim_create_autocmd("User", {
    once = true,
    pattern = "LazyVimStarted",
    callback = function()
      local stats = require("lazy").stats()
      local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
      dashboard.section.footer.val = "⚡ Neovim loaded "
        .. stats.loaded
        .. "/"
        .. stats.count
        .. " plugins in "
        .. ms
        .. "ms"
      pcall(vim.cmd.AlphaRedraw)
    end,
  })

  -- open alpha automatically if all buffers closed
  vim.api.nvim_create_augroup("alpha_on_empty", { clear = true })
  vim.api.nvim_create_autocmd("User", {
    pattern = "BDeletePre *",
    group = "alpha_on_empty",
    callback = function()
      local bufnr = vim.api.nvim_get_current_buf()
      local name = vim.api.nvim_buf_get_name(bufnr)

      if name == "" then vim.cmd [[:Alpha | bd#]] end
    end,
  })

  require("alpha").setup(dashboard.opts)
end

return M
