local words = {}
for word in io.open(vim.fn.stdpath "config" .. "/spell/en.utf-8.add", "r"):lines() do
  table.insert(words, word)
end

return {
  filetypes = { "latex", "tex", "bib", "markdown", "gitcommit", "text" },
  settings = {
    ltex = {
      language = "en-GB",
      dictionary = {
        ["en-US"] = words,
        ["en-GB"] = words,
      },
      setenceCacheSize = 2000,
      disabledRules = {},
    },
  },
}
