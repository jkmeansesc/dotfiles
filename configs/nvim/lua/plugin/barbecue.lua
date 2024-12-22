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

    local c = require "core.colors"

    require("barbecue").setup {
      theme = {
        -- this highlight is used to override other highlights
        -- you can take advantage of its `bg` and set a background throughout your winbar
        -- (e.g. basename will look like this: { fg = "#c0caf5", bold = true })
        normal = { fg = c.text },

        -- these highlights correspond to symbols table from config
        ellipsis = { fg = c.text },
        separator = { fg = c.overlay2 },
        modified = { fg = c.peach },

        -- these highlights represent the _text_ of three main parts of barbecue
        dirname = { fg = c.overlay0 },
        basename = { fg = "#FFFFFF", bold = true },
        context = {},

        -- these highlights are used for context/navic icons
        context_file = { fg = c.rosewater },
        context_module = { fg = c.blue },
        context_namespace = { fg = c.flamingo },
        context_package = { fg = c.sapphire },
        context_class = { fg = c.pink },
        context_method = { fg = c.sky },
        context_property = { fg = c.mauve },
        context_field = { fg = c.teal },
        context_constructor = { fg = c.red },
        context_enum = { fg = c.green },
        context_interface = { fg = c.maroon },
        context_function = { fg = c.yellow },
        context_variable = { fg = c.blue },
        context_constant = { fg = c.rosewater },
        context_string = { fg = c.sapphire },
        context_number = { fg = c.flamingo },
        context_boolean = { fg = c.sky },
        context_array = { fg = c.pink },
        context_object = { fg = c.teal },
        context_key = { fg = c.mauve },
        context_null = { fg = c.green },
        context_enum_member = { fg = c.red },
        context_struct = { fg = c.maroon },
        context_event = { fg = c.blue },
        context_operator = { fg = c.yellow },
        context_type_parameter = { fg = c.rosewater },
      },
      create_autocmd = false, -- prevent barbecue from updating itself automatically
    }
  end,
}
