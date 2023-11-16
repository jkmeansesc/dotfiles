return {

  {
    "NMAC427/guess-indent.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("guess-indent").setup()
      vim.cmd.lua { args = { "require('guess-indent').set_from_buffer('auto_cmd')" }, mods = { silent = true } }
    end,
  },
}
