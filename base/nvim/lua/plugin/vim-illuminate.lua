local M = {
  "RRethy/vim-illuminate",
  event = { "BufReadPre", "BufNewFile" },
}

function M.config()
  require("illuminate").configure {
    delay = 200,
    large_file_cutoff = 2000,
    large_file_overrides = {
      providers = { "lsp" },
    },
  }
end

return M
