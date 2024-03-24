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

    local color = require("core.highlights").colors

    require("barbecue").setup {
      theme = {
        -- this highlight is used to override other highlights
        -- you can take advantage of its `bg` and set a background throughout your winbar
        -- (e.g. basename will look like this: { fg = "#c0caf5", bold = true })
        normal = { fg = color.text },

        -- these highlights correspond to symbols table from config
        ellipsis = { fg = color.text },
        separator = { fg = color.overlay2 },
        modified = { fg = color.peach },

        -- these highlights represent the _text_ of three main parts of barbecue
        dirname = { fg = color.overlay0 },
        basename = { fg = color.white, bold = true },
        context = {},

        -- these highlights are used for context/navic icons
        context_file = { fg = color.rosewater },
        context_module = { fg = color.blue },
        context_namespace = { fg = color.flamingo },
        context_package = { fg = color.sapphire },
        context_class = { fg = color.pink },
        context_method = { fg = color.sky },
        context_property = { fg = color.mauve },
        context_field = { fg = color.teal },
        context_constructor = { fg = color.red },
        context_enum = { fg = color.green },
        context_interface = { fg = color.maroon },
        context_function = { fg = color.yellow },
        context_variable = { fg = color.blue },
        context_constant = { fg = color.rosewater },
        context_string = { fg = color.sapphire },
        context_number = { fg = color.flamingo },
        context_boolean = { fg = color.sky },
        context_array = { fg = color.pink },
        context_object = { fg = color.teal },
        context_key = { fg = color.mauve },
        context_null = { fg = color.green },
        context_enum_member = { fg = color.red },
        context_struct = { fg = color.maroon },
        context_event = { fg = color.blue },
        context_operator = { fg = color.yellow },
        context_type_parameter = { fg = color.rosewater },
      },
      create_autocmd = false, -- prevent barbecue from updating itself automatically
    }
  end,
}
