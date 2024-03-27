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

    local colors = require("core.highlights").colors

    require("barbecue").setup {
      theme = {
        -- this highlight is used to override other highlights
        -- you can take advantage of its `bg` and set a background throughout your winbar
        -- (e.g. basename will look like this: { fg = "#c0caf5", bold = true })
        normal = { fg = colors.text },

        -- these highlights correspond to symbols table from config
        ellipsis = { fg = colors.text },
        separator = { fg = colors.overlay2 },
        modified = { fg = colors.peach },

        -- these highlights represent the _text_ of three main parts of barbecue
        dirname = { fg = colors.overlay0 },
        basename = { fg = colors.white, bold = true },
        context = {},

        -- these highlights are used for context/navic icons
        context_file = { fg = colors.rosewater },
        context_module = { fg = colors.blue },
        context_namespace = { fg = colors.flamingo },
        context_package = { fg = colors.sapphire },
        context_class = { fg = colors.pink },
        context_method = { fg = colors.sky },
        context_property = { fg = colors.mauve },
        context_field = { fg = colors.teal },
        context_constructor = { fg = colors.red },
        context_enum = { fg = colors.green },
        context_interface = { fg = colors.maroon },
        context_function = { fg = colors.yellow },
        context_variable = { fg = colors.blue },
        context_constant = { fg = colors.rosewater },
        context_string = { fg = colors.sapphire },
        context_number = { fg = colors.flamingo },
        context_boolean = { fg = colors.sky },
        context_array = { fg = colors.pink },
        context_object = { fg = colors.teal },
        context_key = { fg = colors.mauve },
        context_null = { fg = colors.green },
        context_enum_member = { fg = colors.red },
        context_struct = { fg = colors.maroon },
        context_event = { fg = colors.blue },
        context_operator = { fg = colors.yellow },
        context_type_parameter = { fg = colors.rosewater },
      },
      create_autocmd = false, -- prevent barbecue from updating itself automatically
    }
  end,
}
