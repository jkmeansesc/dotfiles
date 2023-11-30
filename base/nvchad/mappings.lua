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
		["<C-n>"] = "", -- toggle
		["<leader>e"] = "", -- focus

		-- telescope
		["<leader>cm"] = "",
		["<leader>fw"] = "",
		["<leader>pt"] = "", -- pick a hidden term
		["<leader>th"] = "", -- theme switcher
		["<leader>ma"] = "",

		-- nvterm
		["<A-i>"] = "",
		["<A-h>"] = "",
		["<A-v>"] = "",
		["<leader>h"] = "",
		["<leader>v"] = "",

		-- which-key
		["<leader>wK"] = "",
		["<leader>wk"] = "",

		-- indent_blankline
		["<leader>cc"] = "",

		-- gitsigns
		["]c"] = "",
		["[c"] = "",
		["<leader>rh"] = "",
		["<leader>ph"] = "",
		["<leader>td"] = "",
		["<leader>gb"] = "",

		-- lspconfig
		["gD"] = "",
		["gd"] = "",
		["K"] = "",
		["gi"] = "",
		["<leader>ls"] = "",
		["<leader>D"] = "",
		["<leader>ra"] = "",
		["<leader>ca"] = "",
		["gr"] = "",
		["<leader>lf"] = "",
		["[d"] = "",
		["]d"] = "",
		["<leader>q"] = "",
		["<leader>wa"] = "",
		["<leader>wr"] = "",
		["<leader>wl"] = "",
	},

	v = {
		-- lspconfig
		["<leader>ca"] = "",
	},

	t = {
		-- nvterm
		["<A-i>"] = "",
		["<A-h>"] = "",
		["<A-v>"] = "",
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
		["|"] = { "<C-w>v", "Split vertically" },
		["\\"] = { "<C-w>s", "Split horizontally" },
		["<leader>c"] = { "<cmd>close<CR>", "Close" },
		["<leader>s|"] = { "<C-w>v", "Split vertically" },
		["<leader>s\\"] = { "<C-w>s", "Split horizontally" },
		["<leader>s="] = { "<C-w>=", "Equal size window" },

		["<Esc>"] = { "<cmd> noh <CR>", "Clear highlights" },

		-- save
		["<C-s>"] = { "<cmd>w!<CR>", "Save (force)" },

		-- quit
		["<C-q>"] = { "<cmd>qa<CR>", "Quit" },
		["<C-Q>"] = { "<cmd>qa!<CR>", "Quit (force)" },

		-- copy all
		["<C-c>"] = { "<cmd> %y+ <CR>", "Copy whole file" },

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
				vim.cmd([[
        normal! mzJ`z
        delmarks z]])
			end,
			"Join line",
		},

		-- Package management
		["<leader>ml"] = { "<cmd>Lazy<CR>", "Lazy" },
		["<leader>mm"] = { "<cmd>Mason<CR>", "Mason" },
		["<leader>mi"] = { "<cmd>LspInfo<cr>", "LSP information" },
		["<leader>mn"] = { "<cmd>NullLsInfo<cr>", "Null-ls information" },
		["<leader>mc"] = { "<cmd> NvCheatsheet <CR>", "Mapping cheatsheet" },
		["<leader>mt"] = { "<cmd> Telescope themes <CR>", "Nvchad themes" },
	},

	t = {
		["<C-x>"] = { vim.api.nvim_replace_termcodes("<C-\\><C-N>", true, true, true), "Escape terminal mode" },
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

M.tabufline = {
	plugin = true,

	n = {
		-- cycle through buffers
		["L"] = { -- overrides
			function()
				require("nvchad.tabufline").tabuflineNext()
			end,
			"Next buffer",
		},

		["H"] = { -- overrides
			function()
				require("nvchad.tabufline").tabuflinePrev()
			end,
			"Prev buffer",
		},

		-- close buffer + hide terminal buffer
		["<leader>x"] = {
			function()
				require("nvchad.tabufline").close_buffer()
			end,
			"Close buffer",
		},
	},
}

M.comment = {
	plugin = true,
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
	n = {
		["K"] = { "<cmd>Lspsaga hover_doc<CR>", "Hover doc" },
		["[d"] = { "<cmd>Lspsaga diagnostic_jump_prev<CR>", "Goto prev diagnostic" },
		["]d"] = { "<cmd>Lspsaga diagnostic_jump_next<CR>", "Goto next diagnostic" },
		["gh"] = {
			function()
				vim.diagnostic.open_float({ border = "rounded" })
			end,
			"Floating diagnostic",
		},
		["<leader>ld"] = { "<cmd>Lspsaga peek_definition<CR>", "Peek definition" },
		["<leader>lD"] = {
			function()
				require("telescope.builtin").diagnostics()
			end,
			"Search diagnostics",
		},

		["gd"] = {
			function()
				require("telescope.builtin").lsp_definitions()
			end,
			"Definition",
		},
		["gD"] = {
			function()
				vim.lsp.buf.declaration()
			end,
			"Declaration",
		},
		["gr"] = {
			function()
				require("telescope.builtin").lsp_references()
			end,
			"References",
		},
		["gi"] = {
			function()
				require("telescope.builtin").lsp_implementations()
			end,
			"Implementation",
		},
		["gy"] = {
			function()
				require("telescope.builtin").lsp_type_definitions()
			end,
			"Definition of current type",
		},
		["<leader>ly"] = { "<cmd>Lspsaga peek_type_definition<CR>", "Peek type definition" },
		["<leader>la"] = { "<cmd>Lspsaga code_action<CR>", "Code action" },
		["<leader>lf"] = {
			function()
				vim.lsp.buf.format({ async = true })
			end,
			"Formatting",
		},
		["<leader>lr"] = {
			function()
				vim.lsp.buf.rename()
			end,
			"LSP Rename",
		},
		["<leader>lh"] = {
			function()
				vim.lsp.buf.signature_help()
			end,
			"Signature help",
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

		["<leader>ls"] = {
			function()
				vim.ui.input({ prompt = "Symbol Query: (leave empty for word under cursor)" }, function(query)
					if query then
						-- word under cursor if given query is empty
						if query == "" then
							query = vim.fn.expand("<cword>")
						end
						require("telescope.builtin").lsp_workspace_symbols({
							query = query,
							prompt_title = ("Find word (%s)"):format(query),
						})
					end
				end)
			end,
			"Search workspace symbols",
		},

		["<leader>ll"] = {
			function()
				vim.lsp.codelens.refresh()
			end,
			"CodeLens refresh",
		},
		["<leader>lL"] = {
			function()
				vim.lsp.codelens.run()
			end,
			"CodeLens run",
		},
	},

	v = {
		["<leader>la"] = {
			function()
				vim.lsp.buf.code_action()
			end,
			"LSP code action",
		},
		["<leader>lf"] = {
			function()
				vim.lsp.buf.format({ async = true })
			end,
			"LSP formatting",
		},
	},
}

M.nvimtree = {
	plugin = true,
	n = {
		-- focus
		["<leader>e"] = { "<cmd> NvimTreeFocus <CR>", "Focus nvimtree" },
	},
}

M.telescope = {
	plugin = true,
	n = {
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

		["<leader>fT"] = { "<cmd> Telescope themes <CR>", "Nvchad themes" },
	},
}

M.nvterm = {
	plugin = true,

	t = {
		-- toggle in terminal mode
		["<leader>tt"] = {
			function()
				require("nvterm.terminal").toggle("float")
			end,
			"Toggle floating term",
		},

		["<leader>th"] = {
			function()
				require("nvterm.terminal").toggle("horizontal")
			end,
			"Toggle horizontal term",
		},

		["<leader>tv"] = {
			function()
				require("nvterm.terminal").toggle("vertical")
			end,
			"Toggle vertical term",
		},
	},

	n = {
		-- toggle in normal mode
		["<A-i>"] = {
			function()
				require("nvterm.terminal").toggle("float")
			end,
			"Toggle floating term",
		},

		["<A-h>"] = {
			function()
				require("nvterm.terminal").toggle("horizontal")
			end,
			"Toggle horizontal term",
		},

		["<A-v>"] = {
			function()
				require("nvterm.terminal").toggle("vertical")
			end,
			"Toggle vertical term",
		},

		-- new
		["<leader>th"] = {
			function()
				require("nvterm.terminal").new("horizontal")
			end,
			"New horizontal term",
		},

		["<leader>tv"] = {
			function()
				require("nvterm.terminal").new("vertical")
			end,
			"New vertical term",
		},
	},
}

-- place holder
-- M.whichkey = {}

M.blankline = {
	n = {
		["<leader>J"] = {
			function()
				local ok, start = require("indent_blankline.utils").get_current_context(
					vim.g.indent_blankline_context_patterns,
					vim.g.indent_blankline_use_treesitter_scope
				)

				if ok then
					vim.api.nvim_win_set_cursor(vim.api.nvim_get_current_win(), { start, 0 })
					vim.cmd([[normal! _]])
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
		["]h"] = {
			function()
				require("gitsigns").next_hunk()
			end,
			"Next hunk",
			opts = { expr = true },
		},
		["[h"] = {
			function()
				require("gitsigns").prev_hunk()
			end,
			"Prev hunk",
			opts = { expr = true },
		},

		["<leader>gr"] = {
			function()
				require("gitsigns").reset_hunk()
			end,
			"Reset hunk",
		},
		["<leader>gR"] = {
			function()
				require("gitsigns").reset_buffer()
			end,
			"Reset buffer",
		},
		["<leader>gp"] = {
			function()
				require("gitsigns").preview_hunk()
			end,
			"Preview hunk",
		},
		["<leader>gs"] = {
			function()
				require("gitsigns").stage_hunk()
			end,
			"Stage hunk",
		},
		["<leader>gS"] = {
			function()
				require("gitsigns").stage_buffer()
			end,
			"Stage buffer",
		},
		["<leader>gu"] = {
			function()
				require("gitsigns").undo_stage_hunk()
			end,
			"Undo hunk",
		},
		["<leader>gb"] = {
			function()
				require("gitsigns").blame_line()
			end,
			"Blame line",
		},
		["<leader>gB"] = {
			function()
				require("gitsigns").blame_line({ full = true })
			end,
			"Blame buffer",
		},
		["<leader>gd"] = {
			function()
				require("gitsigns").diffthis()
			end,
			"Git diff",
		},
		["<leader>gt"] = {
			function()
				require("gitsigns").toggle_current_line_blame()
			end,
			"Toggle line blame",
		},
	},
}

M.smartsplits = {
	plugin = true,
	n = {
		["<C-Left>"] = {
			function()
				require("smart-splits").resize_left()
			end,
			"Resize left",
		},
		["<C-Down>"] = {
			function()
				require("smart-splits").resize_down()
			end,
			"Resize down",
		},
		["<C-Up>"] = {
			function()
				require("smart-splits").resize_up()
			end,
			"Resize up",
		},
		["<C-Right>"] = {
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
return M
