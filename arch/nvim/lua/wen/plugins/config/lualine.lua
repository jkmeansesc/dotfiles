local M = {}
M.opts = {
    extensions = { "quickfix", "lazy", "mason", "nvim-dap-ui", "nvim-tree", "toggleterm", "trouble" },
    options = { theme = "catppuccin" },
}
M.config = function(_, opts) require("lualine").setup(opts) end
return M
