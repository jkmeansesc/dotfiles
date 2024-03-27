return {
  "utilyre/barbecue.nvim",
  name = "barbecue",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "SmiteshP/nvim-navic",
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    -- better performance when moving the cursor around
    -- see https://github.com/utilyre/barbecue.nvim?tab=readme-ov-file#-recipes
    vim.opt.updatetime = 200
    vim.api.nvim_create_autocmd({
      "WinResized", --[[ "WinScrolled", ]] -- or WinResized on NVIM-v0.9 and higher
      "BufWinEnter",
      "CursorHold",
      "InsertLeave",
    }, {
      group = vim.api.nvim_create_augroup("barbecue.updater", {}),
      callback = function() require("barbecue.ui").update() end,
    })

    local palette = require("core.highlights").palette

    require("barbecue").setup {
      theme = {
        -- this highlight is used to override other highlights
        -- you can take advantage of its `bg` and set a background throughout your winbar
        -- (e.g. basename will look like this: { fg = "#c0caf5", bold = true })
        normal = { fg = palette.catppuccin.text },

        -- these highlights correspond to symbols table from config
        ellipsis = { fg = palette.catppuccin.text },
        separator = { fg = palette.catppuccin.overlay2 },
        modified = { fg = palette.catppuccin.peach },

        -- these highlights represent the _text_ of three main parts of barbecue
        dirname = { fg = palette.catppuccin.overlay0 },
        basename = { fg = palette.white, bold = true },
        context = {},

        -- these highlights are used for context/navic icons
        context_file = { fg = palette.catppuccin.rosewater },
        context_module = { fg = palette.catppuccin.blue },
        context_namespace = { fg = palette.catppuccin.flamingo },
        context_package = { fg = palette.catppuccin.sapphire },
        context_class = { fg = palette.catppuccin.pink },
        context_method = { fg = palette.catppuccin.sky },
        context_property = { fg = palette.catppuccin.mauve },
        context_field = { fg = palette.catppuccin.teal },
        context_constructor = { fg = palette.catppuccin.red },
        context_enum = { fg = palette.catppuccin.green },
        context_interface = { fg = palette.catppuccin.maroon },
        context_function = { fg = palette.catppuccin.yellow },
        context_variable = { fg = palette.catppuccin.blue },
        context_constant = { fg = palette.catppuccin.rosewater },
        context_string = { fg = palette.catppuccin.sapphire },
        context_number = { fg = palette.catppuccin.flamingo },
        context_boolean = { fg = palette.catppuccin.sky },
        context_array = { fg = palette.catppuccin.pink },
        context_object = { fg = palette.catppuccin.teal },
        context_key = { fg = palette.catppuccin.mauve },
        context_null = { fg = palette.catppuccin.green },
        context_enum_member = { fg = palette.catppuccin.red },
        context_struct = { fg = palette.catppuccin.maroon },
        context_event = { fg = palette.catppuccin.blue },
        context_operator = { fg = palette.catppuccin.yellow },
        context_type_parameter = { fg = palette.catppuccin.rosewater },
      },
      create_autocmd = false, -- prevent barbecue from updating itself automatically
    }
  end,
}
