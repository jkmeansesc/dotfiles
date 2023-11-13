return {
    {
        "akinsho/bufferline.nvim",
        event = "VeryLazy",
        keys = {
            { "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", desc = "Toggle pin" },
            { "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete non-pinned buffers" },
            { "<leader>bo", "<Cmd>BufferLineCloseOthers<CR>", desc = "Delete other buffers" },
            { "<leader>br", "<Cmd>BufferLineCloseRight<CR>", desc = "Delete buffers to the right" },
            { "<leader>bl", "<Cmd>BufferLineCloseLeft<CR>", desc = "Delete buffers to the left" },
            { "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev buffer" },
            { "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer" },
            { "[b", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev buffer" },
            { "]b", "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer" },
        },
        config = require "wen.plugins.config.bufferline",
    },

    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        event = "VeryLazy",
        init = function()
            vim.g.lualine_laststatus = vim.o.laststatus
            if vim.fn.argc(-1) > 0 then
                -- set an empty statusline till lualine loads
                vim.o.statusline = " "
            else
                -- hide the statusline on the starter page
                vim.o.laststatus = 0
            end
        end,
        config = require "wen.plugins.config.lualine",
    },

    {
        "goolord/alpha-nvim",
        event = "VimEnter",
        enabled = true,
        init = false,
        opts = require("wen.plugins.config.alpha-nvim").opts,
        config = require("wen.plugins.config.alpha-nvim").config,
        -- opts = function()
        --     local dashboard = require "alpha.themes.dashboard"
        --     local logo = [[
        --           ████ ██████           █████      ██
        --          ███████████             █████ 
        --          █████████ ███████████████████ ███   ███████████
        --         █████████  ███    █████████████ █████ ██████████████
        --        █████████ ██████████ █████████ █████ █████ ████ █████
        --      ███████████ ███    ███ █████████ █████ █████ ████ █████
        --     ██████  █████████████████████ ████ █████ █████ ████ ██████
        -- ]]
        --
        --     dashboard.section.header.val = vim.split(logo, "\n")
        --     -- stylua: ignore
        --     dashboard.section.buttons.val = {
        --         dashboard.button("f", " " .. " Find file", "<cmd> Telescope find_files <cr>"),
        --         dashboard.button("n", " " .. " New file", "<cmd> ene <BAR> startinsert <cr>"),
        --         dashboard.button("r", " " .. " Recent files", "<cmd> Telescope oldfiles <cr>"),
        --         dashboard.button("g", " " .. " Find text", "<cmd> Telescope live_grep <cr>"),
        --         dashboard.button("c", " " .. " Config",
        --             "<cmd> lua require('lazyvim.util').telescope.config_files()() <cr>"),
        --         dashboard.button("s", " " .. " Restore Session", [[<cmd> lua require("persistence").load() <cr>]]),
        --         dashboard.button("x", " " .. " Lazy Extras", "<cmd> LazyExtras <cr>"),
        --         dashboard.button("l", "󰒲 " .. " Lazy", "<cmd> Lazy <cr>"),
        --         dashboard.button("q", " " .. " Quit", "<cmd> qa <cr>"),
        --     }
        --     for _, button in ipairs(dashboard.section.buttons.val) do
        --         button.opts.hl = "AlphaButtons"
        --         button.opts.hl_shortcut = "AlphaShortcut"
        --     end
        --     dashboard.section.header.opts.hl = "AlphaHeader"
        --     dashboard.section.buttons.opts.hl = "AlphaButtons"
        --     dashboard.section.footer.opts.hl = "AlphaFooter"
        --     dashboard.opts.layout[1].val = 8
        --     return dashboard
        -- end,
        --
        -- config = function(_, dashboard)
        --     -- close Lazy and re-open when the dashboard is ready
        --     if vim.o.filetype == "lazy" then
        --         vim.cmd.close()
        --         vim.api.nvim_create_autocmd("User", {
        --             once = true,
        --             pattern = "AlphaReady",
        --             callback = function() require("lazy").show() end,
        --         })
        --     end
        --
        --     require("alpha").setup(dashboard.opts)
        --
        --     vim.api.nvim_create_autocmd("User", {
        --         once = true,
        --         pattern = "LazyVimStarted",
        --         callback = function()
        --             local stats = require("lazy").stats()
        --             local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
        --             dashboard.section.footer.val = "⚡ Neovim loaded "
        --                 .. stats.loaded
        --                 .. "/"
        --                 .. stats.count
        --                 .. " plugins in "
        --                 .. ms
        --                 .. "ms"
        --             pcall(vim.cmd.AlphaRedraw)
        --         end,
        --     })
        -- end,
    },
}
