local M = {
  "smjonas/inc-rename.nvim",
  event = { "BufReadPre", "BufNewFile" },
}

function M.init()
  require("core.utils").map(
    "n",
    "<leader>r",
    function() return ":IncRename " .. vim.fn.expand "<cword>" end,
    { desc = "Inc-rename", expr = true }
  )
end

function M.config() require("inc_rename").setup() end

return M
