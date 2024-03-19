local M = {
  "famiu/bufdelete.nvim",
  cmd = { "Bdelete", "Bwipeout" },
}

function M.init()
  local map = require("core.utils").map
  map("n", "<C-q>", function() require("bufdelete").bufdelete() end, { desc = "Delete buffer" })
  map("n", "<Leader>bq", function() require("bufdelete").bufdelete(0, true) end, { desc = "Delete buffer (force)" })
  map("n", "<Leader>ba", function()
    local buffers = require("core.utils").get_listed_buffers()
    for _, bufnr in ipairs(buffers) do
      require("bufdelete").bufdelete(bufnr, false)
    end
  end, { desc = "Delete all buffers" })
end

return M
