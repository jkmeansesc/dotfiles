return {
  "hotoo/pangu.vim",
  event = "InsertEnter",
  config = function()
    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = { "*.markdown", "*.md", "*.text", "*.txt", "*.wiki", "*.cnx" },
      callback = function()
        vim.cmd "PanguAll"
        vim.notify("Formated with Pangu", vim.log.levels.INFO)
      end,
    })
  end,
}
