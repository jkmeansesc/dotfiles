return function()
  require("bufferline").setup {
    options = {
      -- stylua: ignore
      close_command = function(n) require("mini.bufremove").delete(n, false) end,
      -- stylua: ignore
      right_mouse_command = function(n) require("mini.bufremove").delete(n, false) end,
      diagnostics = "nvim_lsp",
      always_show_bufferline = false,
      separater_style = "slant",
      -- offsets = {
      --   {
      --     filetype = "neo-tree",
      --     highlight = "Directory",
      --   },
      -- },
    },
  }
end
