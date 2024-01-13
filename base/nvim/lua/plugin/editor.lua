local M = {
  { "echasnovski/mini.bufremove", init = function() require("core.utils").load_mappings "minibufremove" end },
  { "max397574/better-escape.nvim", event = "VimEnter", opts = { timeout = 300 } },
}

return M
