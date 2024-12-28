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
    { "<leader>fb", "<CMD>FzfLua buffers sort_mru=true sort_lastused=true<CR>", desc = "[B]uffer" },
    { "<Leader>ff", "<CMD>FzfLua files<CR>", desc = "[F]iles" },
    { "<Leader><Space>", "<CMD>FzfLua files<CR>", desc = "[F]iles" },
    { "<Leader>fF", "<CMD>FzfLua resume<CR>", desc = "Resume" },
    { "<Leader>fq", "<CMD>FzfLua quickfix<CR>", desc = "[Q]uickfix" },
    { "<Leader>fg", "<CMD>FzfLua live_grep<CR>", desc = "[G]rep" },
    { "<leader>f:", "<CMD>FzfLua command_history<CR>", desc = "Command History" },
    { "<leader>fc", "<CMD>FzfLua git_commits<CR>", desc = "[C]ommits" },
    { "<leader>fs", "<CMD>FzfLua git_status<CR>", desc = "[S]tatus" },
    { '<leader>f"', "<CMD>FzfLua registers<CR>", desc = "Registers" },
    { "<leader>fa", "<CMD>FzfLua autocmds<CR>", desc = "[A]uto Commands" },
    { "<Leader><Space>", "<CMD>FzfLua grep_curbuf<CR>", desc = "Grep This" },
    { "<leader>fh", "<CMD>FzfLua help_tags<CR>", desc = "[H]elp" },
    { "<leader>fH", "<CMD>FzfLua highlights<CR>", desc = "[H]ighlights" },
    { "<leader>fj", "<CMD>FzfLua jumps<CR>", desc = "[J]umplist" },
    { "<leader>fk", "<CMD>FzfLua keymaps<CR>", desc = "[K]eymaps" },
    { "<leader>fl", "<CMD>FzfLua loclist<CR>", desc = "[L]oclist" },
    { "<leader>fM", "<CMD>FzfLua man_pages<CR>", desc = "[M]an Pages" },
    { "<leader>fm", "<CMD>FzfLua marks<CR>", desc = "[M]arks" },
    { "<leader>fC", "<CMD>FzfLua colorschemes<CR>", desc = "[C]olorschemes" },
  },
  init = function() require("fzf-lua").register_ui_select() end,
  config = function()
    require("fzf-lua").setup {
      "fzf-native",
      fzf_colors = true,
      fzf_opts = {
        ["--no-scrollbar"] = true,
      },
      winopts = {
        border = "single",
        preview = {
          default = "bat_native",
          border = "border",
        },
      },
    }
  end,
}
