return {
  "RRethy/vim-illuminate",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("illuminate").configure {
      delay = 100,
      large_file_cutoff = 2000,
      min_count_to_highlight = 2,
      large_file_overrides = {
        providers = { "lsp" },
      },
      filetypes_denylist = {
        "NvimTree",
      },
    }
  end,
}
