local M = {
  "folke/trouble.nvim",
  cmd = { "TroubleToggle", "Trouble" },
  dependencies = { "nvim-tree/nvim-web-devicons" },
  init = function() require("core.utils").load_mappings "trouble" end,
}
M.opts = { use_diagnostic_signs = true }
return M
