local M = {
  "ThePrimeagen/harpoon",
  cmd = { "Harpoon" },
  dependencies = { "nvim-lua/plenary.nvim" },
  init = function() require("core.utils").load_mappings "harpoon" end,
}
return M
