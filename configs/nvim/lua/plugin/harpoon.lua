return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = function()
    local harpoon = require "harpoon"
    return {
      { "<Leader>a", function() harpoon:list():add() end, desc = "Harpoon add file" },
      { "<C-x>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, desc = "Toggle harpoon menu" },
      { "<C-p>", function() harpoon:list():prev() end, desc = "Goto previous mark" },
      { "<C-n>", function() harpoon:list():next() end, desc = "Goto next mark" },
    }
  end,
  config = true,
}
