return {
  {
    "zbirenbaum/copilot.lua",
    event = "InsertEnter",
    cmd = "Copilot",
    build = ":Copilot auth",
    config = function()
      require("copilot").setup {
        suggestion = { enabled = false },
        panel = { enabled = false },
        filetypes = {
          java = true,
          python = true,
          zsh = true,
          toml = true,
          yaml = true,
          markdown = true,
          help = true,
          gitcommit = true,
          gitrebase = true,
          sh = function()
            if string.match(vim.fs.basename(vim.api.nvim_buf_get_name(0)), "^%.env.*") then
              -- disable for .env files
              return false
            end
            return true
          end,
        },
      }
    end,
  },

  { "tpope/vim-dadbod" },

  {
    "saghen/blink.cmp",
    dependencies = {
      "rafamadriz/friendly-snippets",
      "giuxtaposition/blink-cmp-copilot",
      {
        "kristijanhusak/vim-dadbod-completion",
        ft = { "sql", "mysql", "plsql" },
      },
      "saghen/blink.compat",
    },
    version = "*",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("blink.cmp").setup {
        keymap = {
          preset = "none",
          ["<C-w>"] = { "show", "hide", "fallback" },
          ["<C-y>"] = { "select_and_accept", "fallback" },
          ["<CR>"] = { "accept", "fallback" },

          ["<Down>"] = { "select_next", "fallback" },
          ["<Up>"] = { "select_prev", "fallback" },
          ["<C-j>"] = { "select_next", "fallback" },
          ["<C-k>"] = { "select_prev", "fallback" },
          ["<Tab>"] = { "select_next", "fallback" },
          ["<S-Tab>"] = { "select_prev", "fallback" },

          ["<C-n>"] = { "snippet_forward", "fallback" },
          ["<C-p>"] = { "snippet_backward", "fallback" },

          ["<C-u>"] = { "scroll_documentation_up", "fallback" },
          ["<C-d>"] = { "scroll_documentation_down", "fallback" },
        },

        appearance = {
          nerd_font_variant = "mono",
          kind_icons = {
            Copilot = "",
          },
        },

        sources = {
          default = {
            "lsp",
            "snippets",
            "copilot",
            "path",
            "buffer",
            "dadbod",
            "markdown",
            "avante_commands",
            "avante_mentions",
            "avante_files",
          },
          providers = {
            lsp = {
              name = "Lsp",
              module = "blink.cmp.sources.lsp",
              score_offset = 100,
            },
            snippets = {
              name = "Snip",
              module = "blink.cmp.sources.snippets",
              score_offset = 90,
            },
            copilot = {
              name = "Cop",
              module = "blink-cmp-copilot",
              score_offset = 80,
              async = true,
              min_keyword_length = 2,
              transform_items = function(_, items)
                local CompletionItemKind = require("blink.cmp.types").CompletionItemKind
                local kind_idx = #CompletionItemKind + 1
                CompletionItemKind[kind_idx] = "Copilot"
                for _, item in ipairs(items) do
                  item.kind = kind_idx
                end
                return items
              end,
            },
            path = {
              name = "Path",
              module = "blink.cmp.sources.path",
              score_offset = 70,
            },
            buffer = {
              name = "Buff",
              module = "blink.cmp.sources.buffer",
              score_offset = 60,
            },
            dadbod = {
              name = "Dadb",
              module = "vim_dadbod_completion.blink",
              score_offset = 50,
            },
            cmdline = {
              min_keyword_length = 3,
            },
            markdown = {
              name = "RenderMarkdown",
              module = "render-markdown.integ.blink",
              fallbacks = { "lsp" },
            },
            avante_commands = {
              name = "avante_commands",
              module = "blink.compat.source",
              score_offset = 110,
              opts = {},
            },
            avante_files = {
              name = "avante_files",
              module = "blink.compat.source",
              score_offset = 120,
              opts = {},
            },
            avante_mentions = {
              name = "avante_mentions",
              module = "blink.compat.source",
              score_offset = 130,
              opts = {},
            },
          },
        },

        completion = {
          menu = {
            -- Don't show completion menu automatically when searching or in cmdline mode
            auto_show = function(ctx)
              return ctx.mode ~= "cmdline" or not vim.tbl_contains({ "/", "?" }, vim.fn.getcmdtype())
            end,
            border = "single",
            scrollbar = false,
            draw = {
              columns = {
                { "kind_icon" },
                { "label", "label_description", gap = 1 },
                { "source_name" },
              },
            },
          },
          documentation = {
            window = { border = "single" },
            auto_show_delay_ms = 250,
            auto_show = true,
          },
        },

        signature = { window = { border = "single" } },
      }
    end,
  },
}
