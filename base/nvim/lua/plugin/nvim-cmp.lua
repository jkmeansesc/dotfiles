local M = {
  "hrsh7th/nvim-cmp",
  event = { "InsertEnter", "CmdlineEnter" },
  dependencies = {
    "saadparwaiz1/cmp_luasnip", -- for autocompletion
    "hrsh7th/cmp-buffer", -- source for text in buffer
    "hrsh7th/cmp-path", -- source for file system paths
    "onsails/lspkind.nvim", -- vs-code like pictograms
    "hrsh7th/cmp-nvim-lsp",
    { "kawre/neotab.nvim", opts = { tabkey = "" } },
    {
      "zbirenbaum/copilot.lua",
      event = "InsertEnter",
      cmd = "Copilot",
      build = ":Copilot auth",
      opts = {
        suggestion = { enabled = false },
        panel = { enabled = false },
        filetypes = {
          yaml = true,
          markdown = true,
          help = true,
          gitcommit = true,
          gitrebase = true,
        },
      },
    },
    { "zbirenbaum/copilot-cmp", config = true },
    {
      "L3MON4D3/LuaSnip",
      dependencies = "rafamadriz/friendly-snippets", -- useful snippets
      config = function()
        require("luasnip").config.setup {
          history = true,
          delete_check_events = "TextChanged",
          region_check_events = "CursorMoved",
        }
        vim.tbl_map(
          function(type) require("luasnip.loaders.from_" .. type).lazy_load() end,
          { "vscode", "snipmate", "lua" }
        )
        vim.api.nvim_create_autocmd("InsertLeave", {
          callback = function()
            if
              require("luasnip").session.current_nodes[vim.api.nvim_get_current_buf()]
              and not require("luasnip").session.jump_active
            then
              require("luasnip").unlink_current()
            end
          end,
        })
        -- friendly-snippets - enable standardized comments snippets
        require("luasnip").filetype_extend("typescript", { "tsdoc" })
        require("luasnip").filetype_extend("javascript", { "jsdoc" })
        require("luasnip").filetype_extend("lua", { "luadoc" })
        require("luasnip").filetype_extend("python", { "pydoc" })
        require("luasnip").filetype_extend("rust", { "rustdoc" })
        require("luasnip").filetype_extend("cs", { "csharpdoc" })
        require("luasnip").filetype_extend("java", { "javadoc" })
        require("luasnip").filetype_extend("c", { "cdoc" })
        require("luasnip").filetype_extend("cpp", { "cppdoc" })
        require("luasnip").filetype_extend("php", { "phpdoc" })
        require("luasnip").filetype_extend("kotlin", { "kdoc" })
        require("luasnip").filetype_extend("ruby", { "rdoc" })
        require("luasnip").filetype_extend("sh", { "shelldoc" })
      end,
    }, -- snippet engine
  },
}

function M.config()
  local cmp = require "cmp"
  local luasnip = require "luasnip"
  local neotab = require "neotab"
  local check_backspace = function()
    local col = vim.fn.col "." - 1
    ---@diagnostic disable-next-line: param-type-mismatch
    return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
  end

  -- Disabling cmdline completion for IncRename
  cmp.setup.cmdline(":", {
    enabled = function()
      -- Set of commands where cmp will be disabled
      local disabled = { IncRename = true }
      -- Get first word of cmdline
      local cmd = vim.fn.getcmdline():match "%S+"
      -- Return true if cmd isn't disabled
      -- else call/return cmp.close(), which returns false
      return not disabled[cmd] or cmp.close()
    end,
  })

  -- gray
  vim.api.nvim_set_hl(0, "CmpItemAbbrDeprecated", { bg = "NONE", strikethrough = true, fg = "#808080" })
  -- blue
  vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { bg = "NONE", fg = "#89B4FA" })
  vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", { link = "CmpIntemAbbrMatch" })
  -- light blue
  vim.api.nvim_set_hl(0, "CmpItemKindVariable", { bg = "NONE", fg = "#89DCEB" })
  vim.api.nvim_set_hl(0, "CmpItemKindInterface", { link = "CmpItemKindVariable" })
  vim.api.nvim_set_hl(0, "CmpItemKindText", { link = "CmpItemKindVariable" })
  -- pink
  vim.api.nvim_set_hl(0, "CmpItemKindFunction", { bg = "NONE", fg = "#F5C2E7" })
  vim.api.nvim_set_hl(0, "CmpItemKindMethod", { link = "CmpItemKindFunction" })
  -- front
  vim.api.nvim_set_hl(0, "CmpItemKindKeyword", { bg = "NONE", fg = "#F2CDCD" })
  vim.api.nvim_set_hl(0, "CmpItemKindProperty", { link = "CmpItemKindKeyword" })
  vim.api.nvim_set_hl(0, "CmpItemKindUnit", { link = "CmpItemKindKeyword" })
  -- copilot
  vim.api.nvim_set_hl(0, "CmpItemKindCopilot", { fg = "#A6E3A1" })

  cmp.setup {
    enabled = function()
      -- disable completion in comments
      local context = require "cmp.config.context"
      -- keep command mode completion enabled when cursor is in a comment
      if vim.api.nvim_get_mode().mode == "c" then
        return true
      else
        return not context.in_treesitter_capture "comment" and not context.in_syntax_group "Comment"
      end
    end,

    confirm_opts = {
      behavior = cmp.ConfirmBehavior.Replace,
      select = false,
    },

    window = {
      completion = {
        border = "rounded",
        winhighlight = "Normal:Pmenu,CursorLine:PmenuSel,FloatBorder:FloatBorder,Search:None",
        col_offset = -3,
        side_padding = 1,
        scrollbar = false,
        scrolloff = 8,
      },
      documentation = {
        border = "rounded",
        winhighlight = "Normal:Pmenu,FloatBorder:FloatBorder,Search:None",
      },
    },

    completion = {
      completeopt = "menu,menuone,preview,noselect",
    },

    -- configure how nvim-cmp interacts with snippet engine
    snippet = { expand = function(args) luasnip.lsp_expand(args.body) end },

    view = {
      entries = { name = "custom", selection_order = "near_cursor" },
    },

    mapping = {
      ["<Up>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Select },
      ["<Down>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Select },
      ["<C-k>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
      ["<C-j>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
      ["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
      ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
      ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
      ["<C-y>"] = cmp.config.disable,
      ["<C-e>"] = cmp.mapping { i = cmp.mapping.abort(), c = cmp.mapping.close() },
      ["<CR>"] = cmp.mapping.confirm { select = false },
      ["<Tab>"] = cmp.mapping(function()
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        elseif check_backspace() then
          neotab.tabout()
        else
          neotab.tabout()
        end
      end, { "i", "s" }),
      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, { "i", "s" }),
    },

    sources = cmp.config.sources {
      {
        name = "nvim_lsp",
        priority = 1000,
        entry_filter = function(entry, ctx)
          local kind = require("cmp.types.lsp").CompletionItemKind[entry:get_kind()]
          if ctx.prev_context.filetype == "markdown" then return true end
          if kind == "Text" then return false end
          return true
        end,
      },
      { name = "copilot", priority = 900 },
      { name = "luasnip", priority = 800 }, -- snippets
      { name = "buffer", priority = 700 }, -- text within current buffer
      { name = "path", priority = 500 }, -- file system paths
    },

    -- get types on the left, and offset the menu
    formatting = {
      fields = { "kind", "abbr", "menu" },
      format = function(entry, vim_item)
        local kind = require("lspkind").cmp_format {
          mode = "symbol_text",
          maxwidth = 50,
          ellipsis_char = "...",
          symbol_map = { Copilot = "" },
          menu = {
            buffer = "[Buffer]",
            nvim_lsp = "[LSP]",
            luasnip = "[LuaSnip]",
            path = "[Path]",
            copilot = "[Copilot]",
            cmdline = "[Cmdline]",
          },
        }(entry, vim_item)
        local strings = vim.split(kind.kind, "%s", { trimempty = true })
        kind.kind = " " .. (strings[1] or "") .. " "
        return kind
      end,
    },
  }
end
return M
