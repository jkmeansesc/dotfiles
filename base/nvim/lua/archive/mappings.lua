local M = {}

M.bootstrap = {
  i = {
    -- go to beginning and end
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
    -- window management
    ["|"] = { "<C-w>v", "Split vertically" },
    ["\\"] = { "<C-w>s", "Split horizontally" },
    ["<C-c>"] = { "<CMD>close<CR>", "Close" },

    -- save
    ["<C-s>"] = { "<CMD>update<CR>", "Save" },

    -- format
    ["<C-f>"] = {
      function(bufnr)
        vim.lsp.buf.format {
          bufnr = bufnr,
          filter = function(client)
            --  only use null-ls for formatting instead of lsp server
            return client.name == "null-ls"
          end,
        }
      end,
      "Format",
    },

    -- move to start/end of line
    ["H"] = { "^", "Start of line" },
    ["L"] = { "g_", "End of line" },

    -- Do not move my cursor when joining lines.
    ["J"] = {
      function()
        vim.cmd [[
        normal! mzJ`z
        delmarks z]]
      end,
      "Join line",
    },

    -- clear highlights
    ["<Esc>"] = { "<CMD> noh <CR>", "Clear highlights" },

    -- Allow moving the cursor through wrapped lines with j, k, <Up> and <Down>
    -- http://www.reddit.com/r/vim/comments/2k4cbr/problem_with_gj_and_gk/
    -- empty mode is same as using <CMD> :map
    -- also don't use g[j|k] when in operator pending mode, so it doesn't alter d, y or c behaviour
    ["j"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', "Move down", opts = { expr = true } },
    ["k"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', "Move up", opts = { expr = true } },
    ["<Up>"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', "Move up", opts = { expr = true } },
    ["<Down>"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', "Move down", opts = { expr = true } },

    -- Insert a blank line below or above current line (do not move the cursor),
    -- see https://stackoverflow.com/a/16136134/6064933
    ["<Leader>o"] = { "printf('m`%so<ESC>``', v:count1)", "Insert line below", opts = { expr = true } },
    ["<Leader>O"] = { "printf('m`%sO<ESC>``', v:count1)", "Insert line above", opts = { expr = true } },

    -- copy all
    ["<Leader>y"] = { "<CMD>%y+<CR>", "Yank all" },

    -- quit
    ["<Leader>q"] = { "<CMD>x<CR>", "Save and Quit" },
    ["<Leader>Q"] = { "<CMD>wqa!<CR>", "Save and Quit (Force)" },

    -- buffer management
    ["<Leader>bb"] = { "<CMD> enew <CR>", "New buffer" },

    -- Package management
    ["<Leader>ml"] = { "<CMD>Lazy<CR>", "Lazy" },
    ["<Leader>mm"] = { "<CMD>Mason<CR>", "Mason" },
    ["<Leader>mi"] = { "<CMD>LspInfo<CR>", "LSP information" },
    ["<Leader>mn"] = { "<CMD>NullLsInfo<CR>", "Null-ls information" },
    ["<Leader>mr"] = {
      function()
        vim.cmd [[
      update $MYVIMRC
      source $MYVIMRC
    ]]
        vim.notify("Nvim config successfully reloaded!", vim.log.levels.INFO, { title = "nvim-config" })
      end,
      "Reload nvim config",
      opts = { silent = true },
    },
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
    ["p"] = { 'p:let @+=@0<CR>:let @"=@0<CR>', "Don't copy replaced text", opts = { silent = true } },

    ["<"] = { "<gv", "Indent line" },
    [">"] = { ">gv", "Indent line" },

    -- move to start/end of line
    ["H"] = { "^", "Start of line" },
    ["L"] = { "g_", "End of line" },
  },
}

M.bufferline = {
  plugin = true,
  n = {
    ["<Leader>bt"] = {
      "<CMD>BufferLineTogglePin<CR>",
      "Toggle pin",
    },

    ["<Leader>bp"] = {
      "<CMD>BufferLineGroupCloseUngrouped<CR>",
      "Close non-pinned buffers",
    },

    ["<Leader>bo"] = {
      "<CMD>BufferLineCloseOthers<CR>",
      "Close other buffers",
    },

    ["<Leader>br"] = {
      "<CMD>BufferLineCloseRight<CR>",
      "Close buffers to the right",
    },

    ["<Leader>bl"] = {
      "<CMD>BufferLineCloseLeft<CR>",
      "Close buffers to the left",
    },

    ["<S-h>"] = {
      "<CMD>BufferLineCyclePrev<CR>",
      "Prev buffer",
    },

    ["<S-l>"] = {
      "<CMD>BufferLineCycleNext<CR>",
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
    ["<Leader>bh"] = {
      function() require("smart-splits").swap_buf_left() end,
      "Swap left",
    },
    ["<Leader>bj"] = {
      function() require("smart-splits").swap_buf_down() end,
      "Swap down",
    },
    ["<Leader>bk"] = {
      function() require("smart-splits").swap_buf_up() end,
      "Swap up",
    },
    ["<Leader>bl"] = {
      function() require("smart-splits").swap_buf_right() end,
      "Swap right",
    },
  },
}

M.neotree = {
  -- plugin = true,
  n = {
    ["<Leader>e"] = { "<CMD>Neotree position=float toggle=true<CR>", "Toggle Neo-tree" },
  },
}

M.telescope = {
  plugin = true,
  n = {
    -- find
    ["<Leader>ff"] = { "<CMD> Telescope find_files <CR>", "Find files" },
    ["<Leader>fa"] = { "<CMD> Telescope find_files follow=true no_ignore=true hidden=true <CR>", "Find all" },
    ["<Leader>fg"] = { "<CMD> Telescope live_grep <CR>", "Live grep" },
    ["<Leader>fb"] = { "<CMD> Telescope buffers <CR>", "Find buffers" },
    ["<Leader>fh"] = { "<CMD> Telescope help_tags <CR>", "Help page" },
    ["<Leader>fH"] = { "<CMD> Telescope highlights <CR>", "Find highlights" },
    ["<Leader>fo"] = { "<CMD> Telescope oldfiles <CR>", "Find oldfiles" },
    ["<Leader>fz"] = { "<CMD> Telescope current_buffer_fuzzy_find <CR>", "Find in current buffer" },
    ["<Leader>fM"] = { "<CMD> Telescope marks <CR>", "Telescope bookmarks" },
    ["<Leader>fu"] = { "<CMD> Telescope undo<CR>", "Find undo" },
    ["<Leader>fi"] = { "<CMD> Nerdy<CR>", "Find icons" },

    -- git
    ["<Leader>gc"] = { "<CMD> Telescope git_commits <CR>", "Git commits" },
    ["<Leader>gS"] = { "<CMD> Telescope git_status <CR>", "Git status" },

    -- noice history
    ["<Leader>fn"] = { "<CMD> Noice telescope<CR>", "Noice history" },
  },
}

M.gitsigns = {
  plugin = true,
  n = {
    -- Navigation through hunks
    ["]h"] = { function() require("gitsigns").next_hunk() end, "Next hunk", opts = { expr = true } },
    ["[h"] = { function() require("gitsigns").prev_hunk() end, "Prev hunk", opts = { expr = true } },

    -- Actions
    ["<Leader>gr"] = { function() require("gitsigns").reset_hunk() end, "Reset hunk" },
    ["<Leader>gR"] = { function() require("gitsigns").reset_buffer() end, "Reset buffer" },
    ["<Leader>gp"] = { function() require("gitsigns").preview_hunk() end, "Preview hunk" },
    ["<Leader>gs"] = { function() require("gitsigns").stage_hunk() end, "Stage hunk" },
    ["<Leader>gS"] = { function() require("gitsigns").stage_buffer() end, "Stage buffer" },
    ["<Leader>gu"] = { function() require("gitsigns").undo_stage_hunk() end, "Undo hunk" },
    ["<Leader>gb"] = { function() require("gitsigns").blame_line() end, "Blame line" },
    ["<Leader>gB"] = { function() require("gitsigns").blame_line { full = true } end, "Blame buffer" },
    ["<Leader>gd"] = { function() require("gitsigns").diffthis() end, "Git diff" },
    ["<Leader>gt"] = { function() require("gitsigns").toggle_current_line_blame() end, "Toggle line blame" },
  },
}

M.toggleterm = {
  plugin = true,
  n = {
    ["<Leader>tt"] = { "<CMD>ToggleTerm direction=float<CR>", "ToggleTerm float" },
    ["<Leader>th"] = { "<CMD>ToggleTerm size=10 direction=horizontal<CR>", "ToggleTerm horizontal split" },
    ["<Leader>tv"] = { "<CMD>ToggleTerm size=80 direction=vertical<CR>", "ToggleTerm vertical split" },
  },
}

M.nvimtree = {
  plugin = true,
  n = {
    ["<Leader>e"] = { "<CMD>NvimTreeFocus<CR>", "Focus NvimTree" },
  },
}

M.trouble = {
  plugin = true,
  n = {
    ["<Leader>xx"] = { "<CMD>TroubleToggle document_diagnostics<CR>", "Document Diagnostics (Trouble)" },
    ["<Leader>xX"] = { "<CMD>TroubleToggle workspace_diagnostics<CR>", "Workspace Diagnostics (Trouble)" },
    ["<Leader>xL"] = { "<CMD>TroubleToggle loclist<CR>", "Location List (Trouble)" },
    ["<Leader>xQ"] = { "<CMD>TroubleToggle quickfix<CR>", "Quickfix List (Trouble)" },
    ["<Leader>xt"] = { "<CMD>TodoTrouble<CR>", "Todo (Trouble)" },
    ["<Leader>xT"] = { "<CMD>TodoTrouble keywords=TODO,FIX,FIXME<CR>", "Todo/Fix/Fixme (Trouble)" },
    ["[q"] = {
      function()
        if require("trouble").is_open() then
          require("trouble").previous { skip_groups = true, jump = true }
        else
          local ok, err = pcall(vim.cmd.cprev)
          if not ok then vim.notify(err, vim.log.levels.ERROR) end
        end
      end,
      "Previous trouble/quickfix item",
    },
    ["]q"] = {
      function()
        if require("trouble").is_open() then
          require("trouble").next { skip_groups = true, jump = true }
        else
          local ok, err = pcall(vim.cmd.cnext)
          ---@diagnostic disable-next-line: param-type-mismatch
          if not ok then vim.notify(err, vim.log.levels.ERROR) end
        end
      end,
      "Next trouble/quickfix item",
    },
  },
}

M.ssr = {
  plugin = true,
  n = {
    ["<Leader>r"] = { function() require("ssr").open() end, "Open SSR" },
  },
  x = {
    ["<Leader>r"] = { function() require("ssr").open() end, "Open SSR" },
  },
  v = {
    ["<Leader>r"] = { function() require("ssr").open() end, "Open SSR" },
  },
}

M.harpoon = {
  plugin = true,
  n = {
    ["<Leader>a"] = { "<CMD>lua require('harpoon.mark').add_file()<CR>", "Harpoon add file" },
    ["<C-x>"] = {
      function() require("harpoon.ui").toggle_quick_menu() end,
      "Toggle harpoon menu",
    },
    ["<C-p>"] = { function() require("harpoon.ui").nav_prev() end, "Goto previous mark" },
    ["<C-n>"] = { function() require("harpoon.ui").nav_next() end, "Goto next mark" },
  },
}

M.lspconfig = {
  plugin = true,
  n = {
    ["[d"] = { function() vim.diagnostic.goto_prev() end, "Prev diagnostic" },
    ["]d"] = { function() vim.diagnostic.goto_next() end, "Next diagnostic" },
    ["gh"] = { function() vim.diagnostic.open_float { border = "rounded" } end, "Floating diagnostic" },
  },
}

M.cpp = {
  plugin = true,
  n = {
    ["<Leader>lR"] = { "<CMD>ClangdSwitchSourceHeader<CR>", "Switch Source/Header (C/C++)" },
  },
}

M.java = {
  plugin = true,
  n = {
    ["<Leader>jv"] = { function() require("jdtls").extract_variable_all() end, "Extract Variable" },
    ["<Leader>jc"] = { function() require("jdtls").extract_constant() end, "Extract Constant" },
    ["<Leader>js"] = { function() require("jdtls").super_implementation() end, "Goto Super" },
    ["<Leader>jS"] = { function() require("jdtls.tests").goto_subjects() end, "Goto Subjects" },
    ["<Leader>jo"] = { function() require("jdtls").organize_imports() end, "Organize Imports" },
    ["<Leader>jT"] = { function() require("jdtls.dap").test_class() end, "Run All Test" },
    ["<Leader>jt"] = { function() require("jdtls.dap").test_nearest_method() end, "Run Nearest Test" },
    ["<Leader>jr"] = { function() require("jdtls.dap").pick_test() end, "Run Test" },
    ["<Leader>jm"] = { function() require("jdtls").extract_constant.extract_method(true) end, "Extract Method" },
  },

  v = {
    ["<Leader>jm"] = {
      [[<ESC><CMD>lua require('jdtls').extract_method(true)<CR>]],
      "Extract Method",
    },
    ["<Leader>jv"] = {
      [[<ESC><CMD>lua require('jdtls').extract_variable_all(true)<CR>]],
      "Extract Variable",
    },
    ["<Leader>jc"] = {
      [[<ESC><CMD>lua require('jdtls').extract_constant(true)<CR>]],
      "Extract Constant",
    },
  },
}

M.dap = {
  plugin = true,
  n = {
    ["<Leader>du"] = { function() require("dapui").toggle() end, "Dap UI" },
    ["<Leader>de"] = { function() require("dapui").toggle() end, "Eval" },
    ["<Leader>dB"] = {
      function() require("dap").set_breakpoint(vim.fn.input "Breakpoint condition: ") end,
      "Breakpoint Condition",
    },
    ["<Leader>db"] = { function() require("dap").toggle_breakpoint() end, "Toggle Breakpoint" },
    ["<Leader>dc"] = { function() require("dap").continue() end, "Continue" },
    ["<Leader>da"] = {
      function()
        require("dap").continue {
          before = function(config)
            local args = type(config.args) == "function" and (config.args() or {}) or config.args or {}
            config = vim.deepcopy(config)
            ---@cast args string[]
            config.args = function()
              local new_args = vim.fn.input("Run with args: ", table.concat(args, " ")) --[[@as string]]
              return vim.split(vim.fn.expand(new_args) --[[@as string]], " ")
            end
            return config
          end,
        }
      end,
      "Run with Args",
    },
    ["<Leader>dC"] = { function() require("dap").run_to_cursor() end, "Run to Cursor" },
    ["<Leader>dg"] = { function() require("dap").goto_() end, "Go to line (no execute)" },
    ["<Leader>di"] = { function() require("dap").step_into() end, "Step Into" },
    ["<Leader>dj"] = { function() require("dap").down() end, "Down" },
    ["<Leader>dk"] = { function() require("dap").up() end, "Up" },
    ["<Leader>dl"] = { function() require("dap").run_last() end, "Run Last" },
    ["<Leader>do"] = { function() require("dap").step_out() end, "Step Out" },
    ["<Leader>dO"] = { function() require("dap").step_over() end, "Step Over" },
    ["<Leader>dp"] = { function() require("dap").pause() end, "Pause" },
    ["<Leader>dr"] = { function() require("dap").repl.toggle() end, "Toggle REPL" },
    ["<Leader>ds"] = { function() require("dap").session() end, "Session" },
    ["<Leader>dt"] = { function() require("dap").terminate() end, "Terminate" },
    ["<Leader>dw"] = { function() require("dap.ui.widgets").hover() end, "Widgets" },
  },
  v = {
    ["<Leader>de"] = { function() require("dapui").toggle() end, "Eval" },
  },
}

M.gen = {
  plugin = true,
  n = {
    ["<C-g>"] = { ":Gen<CR>", "Gen" },
  },
  v = {
    ["<C-g>"] = { ":Gen<CR>", "Gen" },
  },
}

M.bufdelete = {
  plugin = true,
  n = {
    ["<C-q>"] = { function() require("bufdelete").bufdelete() end, "Delete buffer" },
    ["<Leader>bq"] = { function() require("bufdelete").bufdelete(0, true) end, "Delete buffer (force)" },
    ["<Leader>ba"] = {
      function()
        local buffers = require("core.utils").get_listed_buffers()
        for _, bufnr in ipairs(buffers) do
          require("bufdelete").bufdelete(bufnr, false)
        end
      end,
      "Delete all buffers",
    },
  },
}

M.gp = {
  plugin = true,
  n = {
    ["<C-g>"] = { "<CMD>GpChatToggle popup<CR>", "GPT" },
    ["<Leader>fc"] = { "<CMD>GpChatFinder<CR>", "Find GPT chat" },
  },
}

return M
