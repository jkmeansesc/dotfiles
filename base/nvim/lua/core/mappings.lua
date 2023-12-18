local M = {}

M.general = {
  i = {
    -- go to  beginning and end
    ["<C-b>"] = { "<ESC>^i", "Beginning of line" },
    ["<C-e>"] = { "<End>", "End of line" },

    -- navigate within insert mode
    ["<C-h>"] = { "<Left>", "Move left" },
    ["<C-l>"] = { "<Right>", "Move right" },
    ["<C-j>"] = { "<Down>", "Move down" },
    ["<C-k>"] = { "<Up>", "Move up" },

    -- Turn the word under cursor to upper case
    ["<C-u>"] = { "<Esc>viwUea" },

    -- Turn the current word into title case
    ["<C-t>"] = { "<Esc>b~lea" },
  },

  n = {
    -- buffer management
    ["<leader>bb"] = { "<cmd> enew <CR>", "New buffer" },

    -- window management
    ["|"] = { "<C-w>v", "Split vertically" },
    ["\\"] = { "<C-w>s", "Split horizontally" },
    ["<leader>c"] = { "<cmd>close<CR>", "Close" },
    ["<leader>s|"] = { "<C-w>v", "Split vertically" },
    ["<leader>s\\"] = { "<C-w>s", "Split horizontally" },
    ["<leader>s="] = { "<C-w>=", "Equal size window" },

    ["<Esc>"] = { "<cmd> noh <CR>", "Clear highlights" },

    -- save
    ["<C-s>"] = { "<cmd>w!<CR>", "Save (force)" },
    ["<leader>w"] = { "<cmd>w<CR>", "Save" },

    -- quit
    ["<C-q>"] = { "<cmd>qa<CR>", "Quit" },
    ["<C-Q>"] = { "<cmd>qa!<CR>", "Quit (force)" },

    -- copy all
    ["<leader>y"] = { "<cmd> %y+ <CR>", "Yank all" },

    -- Allow moving the cursor through wrapped lines with j, k, <Up> and <Down>
    -- http://www.reddit.com/r/vim/comments/2k4cbr/problem_with_gj_and_gk/
    -- empty mode is same as using <cmd> :map
    -- also don't use g[j|k] when in operator pending mode, so it doesn't alter d, y or c behaviour
    ["j"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', "Move down", opts = { expr = true } },
    ["k"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', "Move up", opts = { expr = true } },
    ["<Up>"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', "Move up", opts = { expr = true } },
    ["<Down>"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', "Move down", opts = { expr = true } },

    -- Insert a blank line below or above current line (do not move the cursor),
    -- see https://stackoverflow.com/a/16136134/6064933
    ["<leader>o"] = { "printf('m`%so<ESC>``', v:count1)", "Insert line below", opts = { expr = true } },
    ["<leader>O"] = { "printf('m`%sO<ESC>``', v:count1)", "Insert line above", opts = { expr = true } },

    -- Do not move my cursor when joining lines.
    ["J"] = {
      function()
        vim.cmd [[
        normal! mzJ`z
        delmarks z]]
      end,
      "Join line",
    },

    -- Package management
    ["<leader>ml"] = { "<cmd>Lazy<CR>", "Lazy" },
    ["<leader>mm"] = { "<cmd>Mason<CR>", "Mason" },
    ["<leader>mi"] = { "<cmd>LspInfo<cr>", "LSP information" },
    ["<leader>mn"] = { "<cmd>NullLsInfo<cr>", "Null-ls information" },
  },

  v = {
    ["<Up>"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', "Move up", opts = { expr = true } },
    ["<Down>"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', "Move down", opts = { expr = true } },
    ["<"] = { "<gv", "Indent line" },
    [">"] = { ">gv", "Indent line" },
    ["J"] = { ":move '>+1<CR>gv-gv", "Move text down" },
    ["K"] = { ":move '<-2<CR>gv-gv", "Move text up" },
  },

  x = {
    ["j"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', "Move down", opts = { expr = true } },
    ["k"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', "Move up", opts = { expr = true } },
    -- Don't copy the replaced text after pasting in visual mode
    -- https://vim.fandom.com/wiki/Replace_a_word_with_yanked_text#Alternative_mapping_for_paste
    ["p"] = { 'p:let @+=@0<CR>:let @"=@0<CR>', "Dont copy replaced text", opts = { silent = true } },
  },
}

M.increname = {
  plugin = true,
  n = {
    ["<leader>r"] = { ":IncRename ", "IncRename" },
  },
}

M.bufferline = {
  plugin = true,
  n = {
    ["<leader>bt"] = {
      "<Cmd>BufferLineTogglePin<CR>",
      "Toggle pin",
    },

    ["<leader>bp"] = {
      "<cmd>BufferLineGroupCloseUngrouped<cr>",
      "Close non-pinned buffers",
    },

    ["<leader>bo"] = {
      "<cmd>BufferLineCloseOthers<cr>",
      "Close other buffers",
    },

    ["<leader>br"] = {
      "<cmd>BufferLineCloseRight<cr>",
      "Close buffers to the right",
    },

    ["<leader>bl"] = {
      "<cmd>BufferLineCloseLeft<cr>",
      "Close buffers to the left",
    },

    ["<S-h>"] = {
      "<cmd>BufferLineCyclePrev<cr>",
      "Prev buffer",
    },

    ["<S-l>"] = {
      "<cmd>BufferLineCycleNext<cr>",
      "Next buffer",
    },
  },
}

M.smartsplits = {
  plugin = true,
  n = {
    ["<A-h>"] = {
      function() require("smart-splits").resize_left() end,
      "Resize left",
    },
    ["<A-j>"] = {
      function() require("smart-splits").resize_down() end,
      "Resize down",
    },
    ["<A-k>"] = {
      function() require("smart-splits").resize_up() end,
      "Resize up",
    },
    ["<A-l>"] = {
      function() require("smart-splits").resize_right() end,
      "Resize right",
    },
    ["<C-h>"] = {
      function() require("smart-splits").move_cursor_left() end,
      "Move cursor left",
    },
    ["<C-j>"] = {
      function() require("smart-splits").move_cursor_down() end,
      "Move cursor down",
    },
    ["<C-k>"] = {
      function() require("smart-splits").move_cursor_up() end,
      "Move cursor up",
    },
    ["<C-l>"] = {
      function() require("smart-splits").move_cursor_right() end,
      "Move cursor right",
    },
    ["<leader>sh"] = {
      function() require("smart-splits").swap_buf_left() end,
      "Swap left",
    },
    ["<leader>sj"] = {
      function() require("smart-splits").swap_buf_down() end,
      "Swap down",
    },
    ["<leader>sk"] = {
      function() require("smart-splits").swap_buf_up() end,
      "Swap up",
    },
    ["<leader>sl"] = {
      function() require("smart-splits").swap_buf_right() end,
      "Swap right",
    },
  },
}

M.comment = {
  plugin = true,

  -- toggle comment in both modes
  n = {
    ["<leader>/"] = {
      function() require("Comment.api").toggle.linewise.current() end,
      "Toggle comment",
    },
  },

  v = {
    ["<leader>/"] = {
      "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
      "Toggle comment",
    },
  },
}

M.on_attach_cpp = {
  plugin = true,
  n = {
    ["<leader>lR"] = { "<cmd>ClangdSwitchSourceHeader<cr>", "Switch Source/Header (C/C++)" },
  },
}

M.on_attach_java = {
  plugin = true,
  n = {
    ["<leader>jv"] = { function() require("jdtls").extract_variable_all() end, "Extract Variable" },
    ["<leader>jc"] = { function() require("jdtls").extract_constant() end, "Extract Constant" },
    ["<leader>js"] = { function() require("jdtls").super_implementation() end, "Goto Super" },
    ["<leader>jS"] = { function() require("jdtls.tests").goto_subjects() end, "Goto Subjects" },
    ["<leader>jo"] = { function() require("jdtls").organize_imports() end, "Organize Imports" },
    ["<leader>jT"] = { function() require("jdtls.dap").test_class() end, "Run All Test" },
    ["<leader>jt"] = { function() require("jdtls.dap").test_nearest_method() end, "Run Nearest Test" },
    ["<leader>jp"] = { function() require("jdtls.dap").pick_test() end, "Run Test" },
    ["<leader>jm"] = { function() require("jdtls").extract_constant.extract_method(true) end, "Extract Method" },
  },

  v = {
    ["<leader>jm"] = {
      [[<ESC><CMD>lua require('jdtls').extract_method(true)<CR>]],
      "Extract Method",
    },
    ["<leader>jv"] = {
      [[<ESC><CMD>lua require('jdtls').extract_variable_all(true)<CR>]],
      "Extract Variable",
    },
    ["<leader>jc"] = {
      [[<ESC><CMD>lua require('jdtls').extract_constant(true)<CR>]],
      "Extract Constant",
    },
  },
}

M.on_attach_default = {
  plugin = true,
  n = {
    ["K"] = { "<cmd>Lspsaga hover_doc<CR>", "Hover doc" },
    ["[d"] = { "<cmd>Lspsaga diagnostic_jump_prev<CR>", "Goto prev diagnostic" },
    ["]d"] = { "<cmd>Lspsaga diagnostic_jump_next<CR>", "Goto next diagnostic" },
    ["gh"] = { function() vim.diagnostic.open_float { border = "rounded" } end, "Floating diagnostic" },
    ["<leader>ld"] = { "<cmd>Lspsaga peek_definition<CR>", "Peek definition" },
    ["<leader>lD"] = { function() require("telescope.builtin").diagnostics() end, "Search diagnostics" },

    ["gd"] = { function() require("telescope.builtin").lsp_definitions() end, "Definition" },
    ["gD"] = { function() vim.lsp.buf.declaration() end, "Declaration" },
    ["gr"] = { function() require("telescope.builtin").lsp_references() end, "References" },
    ["gi"] = { function() require("telescope.builtin").lsp_implementations() end, "Implementation" },
    ["gy"] = { function() require("telescope.builtin").lsp_type_definitions() end, "Definition of current type" },
    ["<leader>ly"] = { "<cmd>Lspsaga peek_type_definition<CR>", "Peek type definition" },
    ["<leader>la"] = { "<cmd>Lspsaga code_action<CR>", "Code action" },
    ["<leader>lf"] = { function() vim.lsp.buf.format { async = true } end, "Formatting" },
    ["<leader>lr"] = { function() vim.lsp.buf.rename() end, "LSP Rename" },
    ["<leader>lh"] = { function() vim.lsp.buf.signature_help() end, "Signature help" },
    ["<leader>lA"] = { function() vim.lsp.buf.add_workspace_folder() end, "Add workspace folder" },
    ["<leader>lx"] = { function() vim.lsp.buf.remove_workspace_folder() end, "Remove workspace folder" },

    ["<leader>ls"] = {
      function()
        vim.ui.input({ prompt = "Symbol Query: (leave empty for word under cursor)" }, function(query)
          if query then
            -- word under cursor if given query is empty
            if query == "" then query = vim.fn.expand "<cword>" end
            require("telescope.builtin").lsp_workspace_symbols {
              query = query,
              prompt_title = ("Find word (%s)"):format(query),
            }
          end
        end)
      end,
      "Search workspace symbols",
    },

    ["<leader>ll"] = { function() vim.lsp.codelens.refresh() end, "CodeLens refresh" },
    ["<leader>lL"] = { function() vim.lsp.codelens.run() end, "CodeLens run" },
  },

  v = {
    ["<leader>la"] = { function() vim.lsp.buf.code_action() end, "LSP code action" },
    ["<leader>lf"] = { function() vim.lsp.buf.format { async = true } end, "LSP formatting" },
  },
}

M.neotree = {
  plugin = true,
  n = {
    ["<leader>e"] = { "<cmd>Neotree focus<CR>", "Toggle explorer" },
  },
}

M.telescope = {
  plugin = true,
  n = {
    -- find
    ["<leader>ff"] = { "<cmd> Telescope find_files <CR>", "Find files" },
    ["<leader>fa"] = { "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", "Find all" },
    ["<leader>fg"] = { "<cmd> Telescope live_grep <CR>", "Live grep" },
    ["<leader>fb"] = { "<cmd> Telescope buffers <CR>", "Find buffers" },
    ["<leader>fh"] = { "<cmd> Telescope help_tags <CR>", "Help page" },
    ["<leader>fH"] = { "<cmd> Telescope highlights <CR>", "Find highlights" },
    ["<leader>fo"] = { "<cmd> Telescope oldfiles <CR>", "Find oldfiles" },
    ["<leader>fz"] = { "<cmd> Telescope current_buffer_fuzzy_find <CR>", "Find in current buffer" },
    ["<leader>fm"] = { "<cmd> Telescope marks <CR>", "Telescope bookmarks" },
    ["<leader>fu"] = { "<cmd>Telescope undo<CR>", "Find undo" },

    -- git
    ["<leader>gc"] = { "<cmd> Telescope git_commits <CR>", "Git commits" },
    ["<leader>gs"] = { "<cmd> Telescope git_status <CR>", "Git status" },

    -- pick a hidden term
    ["<leader>ft"] = { "<cmd> Telescope terms <CR>", "Pick hidden term" },

    -- noice history
    ["<leader>fn"] = { "<cmd> Noice telescope<CR>", "Noice history" },
  },
}

M.blankline = {
  plugin = true,
  n = {
    ["<leader>J"] = {
      function()
        local ok, start = require("indent_blankline.utils").get_current_context(
          vim.g.indent_blankline_context_patterns,
          vim.g.indent_blankline_use_treesitter_scope
        )

        if ok then
          vim.api.nvim_win_set_cursor(vim.api.nvim_get_current_win(), { start, 0 })
          vim.cmd [[normal! _]]
        end
      end,
      "Jump to current context",
    },
  },
}

M.gitsigns = {
  plugin = true,
  n = {
    -- Navigation through hunks
    ["]h"] = { function() require("gitsigns").next_hunk() end, "Next hunk", opts = { expr = true } },
    ["[h"] = { function() require("gitsigns").prev_hunk() end, "Prev hunk", opts = { expr = true } },

    -- Actions
    ["<leader>gr"] = { function() require("gitsigns").reset_hunk() end, "Reset hunk" },
    ["<leader>gR"] = { function() require("gitsigns").reset_buffer() end, "Reset buffer" },
    ["<leader>gp"] = { function() require("gitsigns").preview_hunk() end, "Preview hunk" },
    ["<leader>gs"] = { function() require("gitsigns").stage_hunk() end, "Stage hunk" },
    ["<leader>gS"] = { function() require("gitsigns").stage_buffer() end, "Stage buffer" },
    ["<leader>gu"] = { function() require("gitsigns").undo_stage_hunk() end, "Undo hunk" },
    ["<leader>gb"] = { function() require("gitsigns").blame_line() end, "Blame line" },
    ["<leader>gB"] = { function() require("gitsigns").blame_line { full = true } end, "Blame buffer" },
    ["<leader>gd"] = { function() require("gitsigns").diffthis() end, "Git diff" },
    ["<leader>gt"] = { function() require("gitsigns").toggle_current_line_blame() end, "Toggle line blame" },
  },
}

M.minibufremove = {
  plugin = true,
  n = {
    ["<leader>q"] = { function() require("core.utils").close() end, "Close buffer" },
    ["<leader>Q"] = { function() require("core.utils").close(0, true) end, "Close buffer (force)" },
    ["<leader>bq"] = { function() require("core.utils").close_all() end, "Close all buffer" },
  },
}

M.toggleterm = {
  plugin = true,
  n = {
    ["<leader>tt"] = { "<cmd>ToggleTerm direction=float<cr>", "ToggleTerm float" },
    ["<leader>th"] = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "ToggleTerm horizontal split" },
    ["<leader>tv"] = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "ToggleTerm vertical split" },
  },
}

M.nvimtree = {
  plugin = true,
  n = {
    ["<leader>e"] = { "<cmd>NvimTreeToggle<CR>", "Toggle explorer" },
  },
}

return M
