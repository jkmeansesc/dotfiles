return {
  "stevearc/dressing.nvim",
  init = function()
    vim.ui.select = function(...)
      require("lazy").load { plugins = { "dressing.nvim" } }
      return vim.ui.select(...)
    end
    vim.ui.input = function(...)
      require("lazy").load { plugins = { "dressing.nvim" } }
      return vim.ui.input(...)
    end
  end,
  opts = { input = { default_prompt = "➤ " }, select = { backend = { "telescope", "builtin" } } },
}
