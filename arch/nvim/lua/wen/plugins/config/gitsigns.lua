return function()
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

vim.keymap.set("n", "<leader>gn", function() require("gitsigns").next_hunk() end, { desc = "next git hunk" })
vim.keymap.set("n", "<leader>gp", function() require("gitsigns").prev_hunk() end, { desc = "previous git hunk" })
vim.keymap.set("n", "<leader>gb", function() require("gitsigns").blame_line() end, { desc = "view git blame" })
vim.keymap.set(
    "n",
    "<leader>gB",
    function() require("gitsigns").blame_line { full = true } end,
    { desc = "view full git blame" }
)
vim.keymap.set("n", "<leader>gv", function() require("gitsigns").preview_hunk() end, { desc = "preview git hunk" })
vim.keymap.set("n", "<leader>gh", function() require("gitsigns").reset_hunk() end, { desc = "reset git hunk" })
vim.keymap.set("n", "<leader>gr", function() require("gitsigns").reset_buffer() end, { desc = "reset git buffer" })
vim.keymap.set("n", "<leader>gs", function() require("gitsigns").stage_hunk() end, { desc = "stage git hunk" })
vim.keymap.set("n", "<leader>gS", function() require("gitsigns").stage_buffer() end, { desc = "stage git buffer" })
vim.keymap.set("n", "<leader>gu", function() require("gitsigns").undo_stage_hunk() end, { desc = "unstage git hunk" })
vim.keymap.set("n", "<leader>gd", function() require("gitsigns").diffthis() end, { desc = "view git diff" })

require("gitsigns").setup {
    signs = {
        add = { text = "│" },
        change = { text = "│" },
        delete = { text = "󰍵" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
        untracked = { text = "│" },
    },
}
end
