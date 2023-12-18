return function()
  require("nvim-autopairs").setup {
    fast_wrap = {},
    check_ts = true,
    ts_config = { java = false },
    disable_filetype = { "TelescopePrompt", "vim" },
  }
  -- setup cmp for autopairs
  local cmp_autopairs = require "nvim-autopairs.completion.cmp"
  require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
end
