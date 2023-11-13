local M = {}

M.init = function()
    -- load gitsigns only when a git file is opened
    vim.api.nvim_create_autocmd({ "BufRead" }, {
        group = vim.api.nvim_create_augroup("GitSignsLazyLoad", { clear = true }),
        callback = function()
            vim.fn.system("git -C " .. '"' .. vim.fn.expand "%:p:h" .. '"' .. " rev-parse")
            if vim.v.shell_error == 0 then
                vim.api.nvim_del_augroup_by_name "GitSignsLazyLoad"
                vim.schedule(function() require("lazy").load { plugins = { "gitsigns.nvim" } } end)
            end
        end,
    })
end

M.opts = {
    signs = {
        add = { text = "│" },
        change = { text = "│" },
        delete = { text = "󰍵" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
        untracked = { text = "│" },
    },
}

M.config = function(_, opts)
    require("which-key").register {
        ["<leader>gn"] = { function() require("gitsigns").next_hunk() end, desc = "Next Git hunk" },
        ["<leader>gp"] = { function() require("gitsigns").prev_hunk() end, desc = "Previous Git hunk" },
        ["<leader>gb"] = { function() require("gitsigns").blame_line() end, desc = "View Git blame" },
        ["<leader>gB"] = { function() require("gitsigns").blame_line { full = true } end, desc = "View full Git blame" },
        ["<leader>gv"] = { function() require("gitsigns").preview_hunk() end, desc = "Preview Git hunk" },
        ["<leader>gh"] = { function() require("gitsigns").reset_hunk() end, desc = "Reset Git hunk" },
        ["<leader>gr"] = { function() require("gitsigns").reset_buffer() end, desc = "Reset Git buffer" },
        ["<leader>gs"] = { function() require("gitsigns").stage_hunk() end, desc = "Stage Git hunk" },
        ["<leader>gS"] = { function() require("gitsigns").stage_buffer() end, desc = "Stage Git buffer" },
        ["<leader>gu"] = { function() require("gitsigns").undo_stage_hunk() end, desc = "Unstage Git hunk" },
        ["<leader>gd"] = { function() require("gitsigns").diffthis() end, desc = "View Git diff" },
    }

    require("gitsigns").setup(opts)
end

return M
