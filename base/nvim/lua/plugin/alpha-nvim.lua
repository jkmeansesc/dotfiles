return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  opts = function()
    vim.api.nvim_set_hl(0, "AlphaNeovimLogoBlue", { fg = "#00BFFF" })
    vim.api.nvim_set_hl(0, "AlphaNeovimLogoGreenFBlueB", { fg = "#70CF67", bg = "#00BFFF" })
    vim.api.nvim_set_hl(0, "AlphaNeovimLogoGreen", { fg = "#70CF67" })
    vim.api.nvim_set_hl(0, "AlphaHeader", { fg = "#f9e2af" })
    vim.api.nvim_set_hl(0, "AlphaButtons", { fg = "#b4befe" })
    vim.api.nvim_set_hl(0, "AlphaFooter", { fg = "#fab387" })
    vim.api.nvim_set_hl(0, "AlphaShortcut", { fg = "#a6e3a1" })
    local dashboard = require "alpha.themes.dashboard"

    -- ╭──────────────────────────────────────────────────────────╮
    -- │ Heading Info                                             │
    -- ╰──────────────────────────────────────────────────────────╯
    -- dashboard.section.header.val = {
    --   [[                                                                       ]],
    --   [[                                                                       ]],
    --   [[                                                                       ]],
    --   [[                                                                       ]],
    --   [[                                                                       ]],
    --   [[                                                                       ]],
    --   [[                                                                       ]],
    --   [[                                                                     ]],
    --   [[       ████ ██████           █████      ██                     ]],
    --   [[      ███████████             █████                             ]],
    --   [[      █████████ ███████████████████ ███   ███████████   ]],
    --   [[     █████████  ███    █████████████ █████ ██████████████   ]],
    --   [[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
    --   [[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
    --   [[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
    --   [[                                                                       ]],
    --   [[                                                                       ]],
    --   [[                                                                       ]],
    -- }

    local thingy =
      io.popen 'echo "$(LANG=en_us_88591; date +%a) $(date +%d) $(LANG=en_us_88591; date +%b)" | tr -d "\n"'
    if thingy == nil then return end
    local date = thingy:read "*a"
    thingy:close()

    local datetime = os.date " %H:%M"

    local hi_top_section = {
      type = "text",
      val = "┌────────────   Today is "
        .. date
        .. " ────────────┐",
      opts = {
        position = "center",
        hl = "AlphaHeader",
      },
    }

    local hi_middle_section = {
      type = "text",
      val = "│                                                │",
      opts = {
        position = "center",
        hl = "AlphaHeader",
      },
    }

    local hi_bottom_section = {
      type = "text",
      val = "└───══───══───══───  "
        .. datetime
        .. "  ───══───══───══────┘",
      opts = {
        position = "center",
        hl = "AlphaHeader",
      },
    }
    dashboard.section.header.val = {
      [[ ███       ███ ]],
      [[████      ████]],
      [[██████     █████]],
      [[███████    █████]],
      [[████████   █████]],
      [[█████████  █████]],
      [[█████ ████ █████]],
      [[█████  █████████]],
      [[█████   ████████]],
      [[█████    ███████]],
      [[█████     ██████]],
      [[████      ████]],
      [[ ███       ███ ]],
      [[                  ]],
      [[ N  E  O  V  I  M ]],
    }
    dashboard.section.header.opts.hl = {
      {
        { "AlphaNeovimLogoBlue", 0, 0 },
        { "AlphaNeovimLogoGreen", 1, 14 },
        { "AlphaNeovimLogoBlue", 23, 34 },
      },
      {
        { "AlphaNeovimLogoBlue", 0, 2 },
        { "AlphaNeovimLogoGreenFBlueB", 2, 4 },
        { "AlphaNeovimLogoGreen", 4, 19 },
        { "AlphaNeovimLogoBlue", 27, 40 },
      },
      {
        { "AlphaNeovimLogoBlue", 0, 4 },
        { "AlphaNeovimLogoGreenFBlueB", 4, 7 },
        { "AlphaNeovimLogoGreen", 7, 22 },
        { "AlphaNeovimLogoBlue", 29, 42 },
      },
      {
        { "AlphaNeovimLogoBlue", 0, 8 },
        { "AlphaNeovimLogoGreenFBlueB", 8, 10 },
        { "AlphaNeovimLogoGreen", 10, 25 },
        { "AlphaNeovimLogoBlue", 31, 44 },
      },
      {
        { "AlphaNeovimLogoBlue", 0, 10 },
        { "AlphaNeovimLogoGreenFBlueB", 10, 13 },
        { "AlphaNeovimLogoGreen", 13, 28 },
        { "AlphaNeovimLogoBlue", 33, 46 },
      },
      {
        { "AlphaNeovimLogoBlue", 0, 13 },
        { "AlphaNeovimLogoGreen", 14, 31 },
        { "AlphaNeovimLogoBlue", 35, 49 },
      },
      {
        { "AlphaNeovimLogoBlue", 0, 13 },
        { "AlphaNeovimLogoGreen", 16, 32 },
        { "AlphaNeovimLogoBlue", 35, 49 },
      },
      {
        { "AlphaNeovimLogoBlue", 0, 13 },
        { "AlphaNeovimLogoGreen", 17, 33 },
        { "AlphaNeovimLogoBlue", 35, 49 },
      },
      {
        { "AlphaNeovimLogoBlue", 0, 13 },
        { "AlphaNeovimLogoGreen", 18, 34 },
        { "AlphaNeovimLogoGreenFBlueB", 33, 35 },
        { "AlphaNeovimLogoBlue", 35, 49 },
      },
      {
        { "AlphaNeovimLogoBlue", 0, 13 },
        { "AlphaNeovimLogoGreen", 19, 35 },
        { "AlphaNeovimLogoGreenFBlueB", 34, 35 },
        { "AlphaNeovimLogoBlue", 35, 49 },
      },
      {
        { "AlphaNeovimLogoBlue", 0, 13 },
        { "AlphaNeovimLogoGreen", 20, 36 },
        { "AlphaNeovimLogoGreenFBlueB", 35, 37 },
        { "AlphaNeovimLogoBlue", 37, 49 },
      },
      {
        { "AlphaNeovimLogoBlue", 0, 13 },
        { "AlphaNeovimLogoGreen", 21, 37 },
        { "AlphaNeovimLogoGreenFBlueB", 36, 37 },
        { "AlphaNeovimLogoBlue", 37, 49 },
      },
      {
        { "AlphaNeovimLogoBlue", 1, 13 },
        { "AlphaNeovimLogoGreen", 20, 35 },
        { "AlphaNeovimLogoBlue", 37, 48 },
      },
      {},
      {
        { "AlphaNeovimLogoGreen", 0, 9 },
        { "AlphaNeovimLogoBlue", 9, 18 },
      },
    }

    -- ╭──────────────────────────────────────────────────────────╮
    -- │ Button                                                   │
    -- ╰──────────────────────────────────────────────────────────╯
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
    dashboard.section.buttons.opts.hl = "AlphaButtons"

    -- ╭──────────────────────────────────────────────────────────╮
    -- │ Footer                                                   │
    -- ╰──────────────────────────────────────────────────────────╯

    dashboard.section.footer.opts = {
      position = "center",
      hl = "AlphaFooter",
    }

    -- display loading time
    vim.api.nvim_create_autocmd("User", {
      once = true,
      pattern = "LazyVimStarted",
      callback = function()
        local stats = require("lazy").stats()
        local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
        local v = vim.version()
        dashboard.section.footer.val = {
          "⚡ Neovim loaded "
            .. stats.loaded
            .. "/"
            .. stats.count
            .. " plugins in "
            .. ms
            .. "ms"
            .. ", "
            .. string.format(" v%d.%d.%d", v.major, v.minor, v.patch),
          "",
          "                    左手只是支撑",
        }
        pcall(vim.cmd.AlphaRedraw)
      end,
    })

    -- ╭──────────────────────────────────────────────────────────╮
    -- │ Setup                                                    │
    -- ╰──────────────────────────────────────────────────────────╯
    -- close Lazy and re-open when the dashboard is ready
    if vim.o.filetype == "lazy" then
      vim.cmd.close()
      vim.api.nvim_create_autocmd("User", {
        once = true,
        pattern = "AlphaReady",
        callback = function() require("lazy").show() end,
      })
    end

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

    local section = {
      header = dashboard.section.header,
      hi_top_section = hi_top_section,
      hi_middle_section = hi_middle_section,
      hi_bottom_section = hi_bottom_section,
      buttons = dashboard.section.buttons,
      footer = dashboard.section.footer,
    }
    return {
      layout = {
        { type = "padding", val = 5 },
        section.header,
        { type = "padding", val = 1 },
        section.hi_top_section,
        section.hi_middle_section,
        section.hi_bottom_section,
        { type = "padding", val = 1 },
        section.buttons,
        { type = "padding", val = 1 },
        section.footer,
      },
      opts = {
        margin = 5,
      },
    }
  end,
}
