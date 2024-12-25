return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = { "MunifTanjim/nui.nvim" },
  config = function()
    require("noice").setup {
      cmdline = {
        view = "cmdline",
        format = {
          cmdline = { icon = " " },
          search_down = { icon = " " },
          search_up = { icon = " " },
          help = { icon = "󰋖 " },
        },
      },
      lsp = {
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
      presets = {
        bottom_search = true, -- use a classic bottom cmdline for search
        command_palette = false, -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = true, -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = false, -- add a border to hover docs and signature help
      },
      routes = {
        {
          filter = {
            event = "msg_show",
            any = {
              { find = "%d+L, %d+B" },
              { find = "; after #%d+" },
              { find = "; before #%d+" },
              { find = "%d fewer lines" },
              { find = "%d more lines" },
              { kind = "search_count" },
              { kind = "", find = "written" },
              { find = "^%d+ lines yanked$" },
            },
          },
          opts = { skip = true },
        },
      },
      popupmenu = { enabled = false },
    }
  end,
}
