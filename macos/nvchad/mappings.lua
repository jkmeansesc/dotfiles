---@type MappingsTable
local M = {}

-- In order to disable a default keymap, use
M.disabled = {

	n = {
		-- tabufline
		["<tab>"] = "",
		["<S-tab>"] = "",

		-- line numbers
		["<leader>n"] = "",
		["<leader>rn"] = "",

		-- switch between windows
		["<C-h>"] = "",
		["<C-l>"] = "",
		["<C-j>"] = "",
		["<C-k>"] = "",

		-- new buffer
		["<leader>b"] = "",
		["<leader>ch"] = "",

		-- nvim-tree
		-- toggle
		["<C-n>"] = "",
		-- focus
		["<leader>e"] = "",

		-- lspconfig
		["<leader>ra"] = "",
		["<leader>ca"] = "",
		["<leader>lf"] = "",
		["<leader>q"] = "",
		["<leader>wa"] = "",
		["<leader>wr"] = "",
		["<leader>wl"] = "",

		-- telescope
		["<leader>cm"] = "",
		-- theme switcher
		["<leader>th"] = "",
		["<leader>ma"] = "",
		-- pick a hidden term
		["<leader>pt"] = "",

		-- which-key
    ["<leader>wK"] = "",
    ["<leader>wk"] = "",

		-- indent_blankline
    ["<leader>cc"] = "",

		-- gitsigns
    -- Navigation through hunks
    ["]c"] = "",
    ["[c"] = "",
    -- Actions
    ["<leader>rh"] = "",
    ["<leader>ph"] = "",
    ["<leader>td"] = "",
	},
}

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
		["|"] = { "<C-w>v", "Split window vertically" },
		["\\"] = { "<C-w>s", "Split window horizontally" },
		["<leader>s|"] = { "<C-w>v", "Split window vertically" },
		["<leader>s\\"] = { "<C-w>s", "Split window horizontally" },
		["<leader>s="] = { "<C-w>=", "Split window equal size" },
		["<leader>sx"] = { "<cmd>close<CR>", "Close split" },
		["<Esc>"] = { "<cmd> noh <CR>", "Clear highlights" },

		-- save
		["<C-s>"] = { "<cmd> w <CR>", "Save file" },

		-- Copy all
		["<C-c>"] = { "<cmd> %y+ <CR>", "Copy whole file" },

		-- Allow moving the cursor through wrapped lines with j, k, <Up> and <Down>
		-- http://www.reddit.com/r/vim/comments/2k4cbr/problem_with_gj_and_gk/
		-- empty mode is same as using <cmd> :map
		-- also don't use g[j|k] when in operator pending mode, so it doesn't alter d, y or c behaviour
		["j"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', "Move down", opts = { expr = true } },
		["k"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', "Move up", opts = { expr = true } },
		["<Up>"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', "Move up", opts = { expr = true } },
		["<Down>"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', "Move down", opts = { expr = true } },

		["<leader>lf"] = {
			function()
				vim.lsp.buf.format({ async = true })
			end,
			"LSP formatting",
		},

		-- Nvchad management
		["<leader>mc"] = { "<cmd> NvCheatsheet <CR>", "Mapping cheatsheet" },

		-- Insert a blank line below or above current line (do not move the cursor),
		-- see https://stackoverflow.com/a/16136133/6064933
		["<leader>o"] = { "o<Esc>k", "Insert line below", opts = { expr = true } },
		["<leader>O"] = { "o<Esc>j", "Insert line above", opts = { expr = true } },

		-- Do not move my cursor when joining lines.
		["J"] = {
			function()
				vim.cmd([[ normal! mzJ`z delmarks z]])
			end,
			"Join line",
		},
	},

	t = {
		["<C-x>"] = { vim.api.nvim_replace_termcodes("<C-\\><C-N>", true, true, true), "Escape terminal mode" },
	},

	v = {
		["J"] = { ":move '>+1<CR>gv-gv", "Move text up" },
		["K"] = { ":move '<-2<CR>gv-gv", "Move text down" },
		["<Up>"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', "Move up", opts = { expr = true } },
		["<Down>"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', "Move down", opts = { expr = true } },
		["<"] = { "<gv", "Indent line" },
		[">"] = { ">gv", "Indent line" },
	},

	x = {
		["j"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', "Move down", opts = { expr = true } },
		["k"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', "Move up", opts = { expr = true } },
		-- Don't copy the replaced text after pasting in visual mode
		-- https://vim.fandom.com/wiki/Replace_a_word_with_yanked_text#Alternative_mapping_for_paste
		["p"] = { 'p:let @+=@0<CR>:let @"=@0<CR>', "Dont copy replaced text", opts = { silent = true } },
	},
}

-- more keybinds!

M.tabufline = {
	plugin = true,

	n = {
		-- cycle through buffers
		["L"] = {
			function()
				require("nvchad.tabufline").tabuflineNext()
			end,
			"Next buffer",
		},

		["H"] = {
			function()
				require("nvchad.tabufline").tabuflinePrev()
			end,
			"Prev buffer",
		},
	},
}

M.smartsplits = {

	n = {
		["<A-h>"] = {
			function()
				require("smart-splits").resize_left()
			end,
			"Resize left",
		},
		["<A-j>"] = {
			function()
				require("smart-splits").resize_down()
			end,
			"Resize down",
		},
		["<A-k>"] = {
			function()
				require("smart-splits").resize_up()
			end,
			"Resize up",
		},
		["<A-l>"] = {
			function()
				require("smart-splits").resize_right()
			end,
			"Resize right",
		},
		["<C-h>"] = {
			function()
				require("smart-splits").move_cursor_left()
			end,
			"Move cursor left",
		},
		["<C-j>"] = {
			function()
				require("smart-splits").move_cursor_down()
			end,
			"Move cursor down",
		},
		["<C-k>"] = {
			function()
				require("smart-splits").move_cursor_up()
			end,
			"Move cursor up",
		},
		["<C-l>"] = {
			function()
				require("smart-splits").move_cursor_right()
			end,
			"Move cursor right",
		},
		["<leader>sh"] = {
			function()
				require("smart-splits").swap_buf_left()
			end,
			"Swap left",
		},
		["<leader>sj"] = {
			function()
				require("smart-splits").swap_buf_down()
			end,
			"Swap down",
		},
		["<leader>sk"] = {
			function()
				require("smart-splits").swap_buf_up()
			end,
			"Swap up",
		},
		["<leader>sl"] = {
			function()
				require("smart-splits").swap_buf_right()
			end,
			"Swap right",
		},
	},
}

M.comment = {
	n = {
		["<leader>/"] = {
			function()
				require("Comment.api").toggle.linewise.current()
			end,
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

M.lspconfig = {
	plugin = true,

	-- See `<cmd> :help vim.lsp.*` for documentation on any of the below functions

	n = {
		["gD"] = {
			function()
				vim.lsp.buf.declaration()
			end,
			"LSP declaration",
		},

		["<leader>lD"] = {
			function()
				vim.lsp.buf.declaration()
			end,
			"LSP declaration",
		},

		["gd"] = {
			function()
				vim.lsp.buf.definition()
			end,
			"LSP definition",
		},

		["<leader>ld"] = {
			function()
				vim.lsp.buf.definition()
			end,
			"LSP definition",
		},

		["K"] = {
			function()
				vim.lsp.buf.hover()
			end,
			"LSP hover",
		},

		["<leader>lK"] = {
			function()
				vim.lsp.buf.hover()
			end,
			"LSP hover",
		},

		["gi"] = {
			function()
				vim.lsp.buf.implementation()
			end,
			"LSP implementation",
		},

		["<leader>li"] = {
			function()
				vim.lsp.buf.implementation()
			end,
			"LSP implementation",
		},

		["<leader>ls"] = {
			function()
				vim.lsp.buf.signature_help()
			end,
			"LSP signature help",
		},

		["<leader>D"] = {
			function()
				vim.lsp.buf.type_definition()
			end,
			"LSP definition type",
		},

		["<leader>lR"] = {
			function()
				require("nvchad.renamer").open()
			end,
			"LSP rename",
		},

		["<leader>la"] = {
			function()
				vim.lsp.buf.code_action()
			end,
			"LSP code action",
		},

		["gr"] = {
			function()
				vim.lsp.buf.references()
			end,
			"LSP references",
		},

		["<leader>lr"] = {
			function()
				vim.lsp.buf.references()
			end,
			"LSP references",
		},

		["<leader>lh"] = {
			function()
				vim.diagnostic.open_float({ border = "rounded" })
			end,
			"Floating diagnostic",
		},

		["[d"] = {
			function()
				vim.diagnostic.goto_prev({ float = { border = "rounded" } })
			end,
			"Goto prev",
		},

		["]d"] = {
			function()
				vim.diagnostic.goto_next({ float = { border = "rounded" } })
			end,
			"Goto next",
		},

		["<leader>lq"] = {
			function()
				vim.diagnostic.setloclist()
			end,
			"Diagnostic setloclist",
		},

		["<leader>lA"] = {
			function()
				vim.lsp.buf.add_workspace_folder()
			end,
			"Add workspace folder",
		},

		["<leader>lx"] = {
			function()
				vim.lsp.buf.remove_workspace_folder()
			end,
			"Remove workspace folder",
		},

		["<leader>ll"] = {
			function()
				print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
			end,
			"List workspace folders",
		},
	},

	v = {
		["<leader>ca"] = {
			function()
				vim.lsp.buf.code_action()
			end,
			"LSP code action",
		},
	},
}

M.nvimtree = {

	n = {
		["<leader>e"] = { "<cmd> NvimTreeToggle <CR>", "Toggle explorer" },
	},
}

M.telescope = {

	n = {
		-- find
		["<leader>ff"] = { "<cmd> Telescope find_files <CR>", "Find files" },
		["<leader>fa"] = { "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", "Find all" },
		["<leader>fw"] = { "<cmd> Telescope live_grep <CR>", "Live grep" },
		["<leader>fb"] = { "<cmd> Telescope buffers <CR>", "Find buffers" },
		["<leader>fh"] = { "<cmd> Telescope help_tags <CR>", "Help page" },
		["<leader>fo"] = { "<cmd> Telescope oldfiles <CR>", "Find oldfiles" },
		["<leader>fz"] = { "<cmd> Telescope current_buffer_fuzzy_find <CR>", "Find in current buffer" },

		-- git
		["<leader>gc"] = { "<cmd> Telescope git_commits <CR>", "Git commits" },
		["<leader>gt"] = { "<cmd> Telescope git_status <CR>", "Git status" },

		-- pick a hidden term
		["<leader>ft"] = { "<cmd> Telescope terms <CR>", "Pick hidden term" },

		-- theme switcher
		["<leader>mt"] = { "<cmd> Telescope themes <CR>", "Nvchad themes" },
		["<leader>fm"] = { "<cmd> Telescope marks <CR>", "telescope bookmarks" },
	},
}

M.nvterm = {

  t = {
    -- toggle in terminal mode
    ["<A-i>"] = {
      function()
        require("nvterm.terminal").toggle "float"
      end,
      "Toggle floating term",
    },

    ["<A-h>"] = {
      function()
        require("nvterm.terminal").toggle "horizontal"
      end,
      "Toggle horizontal term",
    },

    ["<A-v>"] = {
      function()
        require("nvterm.terminal").toggle "vertical"
      end,
      "Toggle vertical term",
    },
  },

  n = {
    -- toggle in normal mode
    ["<A-i>"] = {
      function()
        require("nvterm.terminal").toggle "float"
      end,
      "Toggle floating term",
    },

    ["<A-h>"] = {
      function()
        require("nvterm.terminal").toggle "horizontal"
      end,
      "Toggle horizontal term",
    },

    ["<A-v>"] = {
      function()
        require("nvterm.terminal").toggle "vertical"
      end,
      "Toggle vertical term",
    },

    -- new
    ["<leader>h"] = {
      function()
        require("nvterm.terminal").new "horizontal"
      end,
      "New horizontal term",
    },

    ["<leader>v"] = {
      function()
        require("nvterm.terminal").new "vertical"
      end,
      "New vertical term",
    },
  },
}

M.blankline = {

  n = {
    ["<leader>c"] = {
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

  n = {
    -- Navigation through hunks
    ["]h"] = {
      function()
        if vim.wo.diff then
          return "]h"
        end
        vim.schedule(function()
          require("gitsigns").next_hunk()
        end)
        return "<Ignore>"
      end,
      "Jump to next hunk",
      opts = { expr = true },
    },

    ["[h"] = {
      function()
        if vim.wo.diff then
          return "[h"
        end
        vim.schedule(function()
          require("gitsigns").prev_hunk()
        end)
        return "<Ignore>"
      end,
      "Jump to prev hunk",
      opts = { expr = true },
    },

    -- Actions
    ["<leader>gr"] = {
      function()
        require("gitsigns").reset_hunk()
      end,
      "Reset hunk",
    },

    ["<leader>gp"] = {
      function()
        require("gitsigns").preview_hunk()
      end,
      "Preview hunk",
    },

    ["<leader>gb"] = {
      function()
        package.loaded.gitsigns.blame_line()
      end,
      "Blame line",
    },

    ["<leader>gt"] = {
      function()
        require("gitsigns").toggle_deleted()
      end,
      "Toggle deleted",
    },
  },
}

return M
