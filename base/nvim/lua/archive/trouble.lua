local M = {
    "folke/trouble.nvim",
    cmd = { "TroubleToggle", "Trouble" },
    dependencies = { "nvim-tree/nvim-web-devicons" },
}
M.opts = { use_diagnostic_signs = true }
return M
