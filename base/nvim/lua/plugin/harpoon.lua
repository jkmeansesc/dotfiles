local M = {
  "ThePrimeagen/harpoon",
  cmd = { "Harpoon" },
  dependencies = { "nvim-lua/plenary.nvim" },
}

function M.init()
  local map = require("core.utils").map
  map("n", "<Leader>a", function() require("harpoon.mark").add_file() end, { desc = "Harpoon add file" })
  map("n", "<C-x>", function() require("harpoon.ui").toggle_quick_menu() end, { desc = "Toggle harpoon menu" })
  map("n", "<C-p>", function() require("harpoon.ui").nav_prev() end, { desc = "Goto previous mark" })
  map("n", "<C-n>", function() require("harpoon.ui").nav_next() end, { desc = "Goto next mark" })
end

return M
