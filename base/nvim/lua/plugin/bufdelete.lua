return {
  "famiu/bufdelete.nvim",
  keys = {
    { "<C-q>", function() require("bufdelete").bufdelete() end, desc = "Delete buffer" },
    {
      "<Leader>bq",
      function()
        local buffers = require("core.utils").get_listed_buffers()
        for _, bufnr in ipairs(buffers) do
          require("bufdelete").bufdelete(bufnr, false)
        end
      end,
      desc = "Delete all buffers",
    },
  },
}
