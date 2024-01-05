local M = {
  "NMAC427/guess-indent.nvim",
  event = { "BufReadPre", "BufNewFile" },
}

function M.config()
  vim.cmd.lua { args = { "require('guess-indent').set_from_buffer('auto_cmd')" }, mods = { silent = true } }
end

return M
