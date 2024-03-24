return {
  "ThePrimeagen/harpoon",
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    { "<Leader>a", function() require("harpoon.mark").add_file() end, desc = "Harpoon add file" },
    { "<C-x>", function() require("harpoon.ui").toggle_quick_menu() end, desc = "Toggle harpoon menu" },
    { "<C-p>", function() require("harpoon.ui").nav_prev() end, desc = "Goto previous mark" },
    { "<C-n>", function() require("harpoon.ui").nav_next() end, desc = "Goto next mark" },
  },
  config = function() require("core.utils").setPluginHighlights "harpoon" end,
}
