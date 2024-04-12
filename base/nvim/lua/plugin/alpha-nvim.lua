return {
    "goolord/alpha-nvim",
    event = "VimEnter",
    config = function()
        -- ╭──────────────────────────────────────────────────────────╮
        -- │ set highlight                                            │
        -- ╰──────────────────────────────────────────────────────────╯
        require("core.utils").setPluginHighlights "alpha"

        -- ╭──────────────────────────────────────────────────────────╮
        -- │ Heading Info                                             │
        -- ╰──────────────────────────────────────────────────────────╯
        local dashboard = require "alpha.themes.dashboard"
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
                { "AlphaLogoBlue", 0, 0 },
                { "AlphaLogoGreen", 1, 14 },
                { "AlphaLogoBlue", 23, 34 },
            },
            {
                { "AlphaLogoBlue", 0, 2 },
                { "AlphaLogoGreenFBlueB", 2, 4 },
                { "AlphaLogoGreen", 4, 19 },
                { "AlphaLogoBlue", 27, 40 },
            },
            {
                { "AlphaLogoBlue", 0, 4 },
                { "AlphaLogoGreenFBlueB", 4, 7 },
                { "AlphaLogoGreen", 7, 22 },
                { "AlphaLogoBlue", 29, 42 },
            },
            {
                { "AlphaLogoBlue", 0, 8 },
                { "AlphaLogoGreenFBlueB", 8, 10 },
                { "AlphaLogoGreen", 10, 25 },
                { "AlphaLogoBlue", 31, 44 },
            },
            {
                { "AlphaLogoBlue", 0, 10 },
                { "AlphaLogoGreenFBlueB", 10, 13 },
                { "AlphaLogoGreen", 13, 28 },
                { "AlphaLogoBlue", 33, 46 },
            },
            {
                { "AlphaLogoBlue", 0, 13 },
                { "AlphaLogoGreen", 14, 31 },
                { "AlphaLogoBlue", 35, 49 },
            },
            {
                { "AlphaLogoBlue", 0, 13 },
                { "AlphaLogoGreen", 16, 32 },
                { "AlphaLogoBlue", 35, 49 },
            },
            {
                { "AlphaLogoBlue", 0, 13 },
                { "AlphaLogoGreen", 17, 33 },
                { "AlphaLogoBlue", 35, 49 },
            },
            {
                { "AlphaLogoBlue", 0, 13 },
                { "AlphaLogoGreen", 18, 34 },
                { "AlphaLogoGreenFBlueB", 33, 35 },
                { "AlphaLogoBlue", 35, 49 },
            },
            {
                { "AlphaLogoBlue", 0, 13 },
                { "AlphaLogoGreen", 19, 35 },
                { "AlphaLogoGreenFBlueB", 34, 35 },
                { "AlphaLogoBlue", 35, 49 },
            },
            {
                { "AlphaLogoBlue", 0, 13 },
                { "AlphaLogoGreen", 20, 36 },
                { "AlphaLogoGreenFBlueB", 35, 37 },
                { "AlphaLogoBlue", 37, 49 },
            },
            {
                { "AlphaLogoBlue", 0, 13 },
                { "AlphaLogoGreen", 21, 37 },
                { "AlphaLogoGreenFBlueB", 36, 37 },
                { "AlphaLogoBlue", 37, 49 },
            },
            {
                { "AlphaLogoBlue", 1, 13 },
                { "AlphaLogoGreen", 20, 35 },
                { "AlphaLogoBlue", 37, 48 },
            },
            {},
            {
                { "AlphaLogoGreen", 0, 9 },
                { "AlphaLogoBlue", 9, 18 },
            },
        }

        -- ╭──────────────────────────────────────────────────────────╮
        -- │ Button                                                   │
        -- ╰──────────────────────────────────────────────────────────╯
        dashboard.section.buttons.val = {
            dashboard.button("f", " " .. " Find file", "<CMD> Telescope find_files <CR>"),
            dashboard.button("n", " " .. " New file", "<CMD> ene <BAR> startinsert <CR>"),
            dashboard.button("r", " " .. " Recent files", "<CMD> Telescope oldfiles <CR>"),
            dashboard.button("g", " " .. " Find text", "<CMD> Telescope live_grep <CR>"),
            dashboard.button("s", "󰦛 " .. " Restore last session", "<CMD> SessionRestore <CR>"),
            dashboard.button("q", " " .. " Quit", "<CMD> qa <CR>"),
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

        require("alpha").setup {
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
