return {
  "ibhagwan/fzf-lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "2kabhishek/nerdy.nvim", -- search nerd icons
  },
  cmd = "FzfLua",
  keys = {
    { "<C-j>", "<C-j>", ft = "fzf", mode = "t", nowait = true },
    { "<C-k>", "<C-k>", ft = "fzf", mode = "t", nowait = true },
    {
      "<leader>fb",
      "<cmd>FzfLua buffers sort_mru=true sort_lastused=true<cr>",
      desc = "Switch Buffer",
    },
    { "<Leader>ff", "<CMD>FzfLua files<CR>", desc = "[F]iles" },
    { "<Leader>fF", "<CMD>FzfLua resume<CR>", desc = "Resume" },
    { "<Leader>fq", "<CMD>FzfLua quickfix<CR>", desc = "[B]uffers" },
  },
  config = function()
    require("fzf-lua").setup {
      "default-title",
      winopts = {},
    }
  end,
}
