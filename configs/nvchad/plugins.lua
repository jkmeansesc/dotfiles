---@type NvPluginSpec[]
local plugins = {

	-- override plugin configs
	{ "jose-elias-alvarez/null-ls.nvim", enabled = false },

	{
		"williamboman/mason.nvim",
		opts = {}, -- overrides
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"jay-babu/mason-null-ls.nvim",
			{ "jay-babu/mason-nvim-dap.nvim", dependencies = { "nvim-dap" } },
		},
		config = require("custom.configs.mason"),
	},

	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
		opts = {
			ensure_installed = { -- extend
				-- general
				"bash",
				"css",
				"dockerfile",
				"gitignore",
				"html",
				"javascript",
				"jsdoc",
				"json",
				"jsonc",
				"latex",
				"lua",
				"luadoc",
				"luap",
				"python",
				"query",
				"regex",
				"toml",
				"tsx",
				"typescript",
				"vim",
				"vimdoc",
				"yaml",
				-- markdown
				"markdown",
				"markdown_inline",
				-- java
				"java",
				-- c++
				"c",
				"cpp",
				"objc",
				"cuda",
				"proto",
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<CR>",
					node_incremental = "<CR>",
					node_decremental = "<BS>",
					scope_incremental = false,
				},
			},
		},
	},

	{
		"hrsh7th/nvim-cmp",
		event = { "InsertEnter", "CmdlineEnter" }, -- overrides
	},
	-- {
	-- 	"nvim-tree/nvim-tree.lua",
	-- },
	--
	-- {
	-- 	"folke/which-key.nvim",
	-- 	event = "VeryLazy",
	-- },

	-- EDITOR
	{ "karb94/neoscroll.nvim", event = "VeryLazy", config = true },

	{ "kylechui/nvim-surround", event = "VeryLazy", config = true },

	{ "max397574/better-escape.nvim", event = "InsertCharPre", opts = { timeout = 300 } },

	{
		"NMAC427/guess-indent.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("guess-indent").setup()
			vim.cmd.lua({ args = { "require('guess-indent').set_from_buffer('auto_cmd')" }, mods = { silent = true } })
		end,
	},

	{
		"mrjones2014/smart-splits.nvim",
		event = "VeryLazy",
		init = function()
			require("core.utils").load_mappings("smartsplits")
		end,
		opts = {
			ignored_filetypes = { "nofile", "quickfix", "qf", "prompt" },
			ignored_buftypes = { "nofile" },
		},
	},

	-- {
	-- 	"stevearc/dressing.nvim",
	-- 	lazy = true,
	-- 	init = function()
	-- 		vim.ui.select = function(...)
	-- 			require("lazy").load({ plugins = { "dressing.nvim" } })
	-- 			return vim.ui.select(...)
	-- 		end
	-- 		vim.ui.input = function(...)
	-- 			require("lazy").load({ plugins = { "dressing.nvim" } })
	-- 			return vim.ui.input(...)
	-- 		end
	-- 	end,
	-- 	opts = {
	-- 		input = { default_prompt = "➤ " },
	-- 		select = { backend = { "telescope", "builtin" } },
	-- 	},
	-- },

	{
		"folke/todo-comments.nvim",
		event = "VeryLazy",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			dofile(vim.g.base46_cache .. "todo")
			require("todo-comments").setup()
		end,
	},

	{
		"nvimtools/none-ls.nvim",
		lazy = true,
		event = { "BufReadPre", "BufNewFile" },
		dependencies = { "jay-babu/mason-null-ls.nvim" },
		config = function()
			local null_ls = require("null-ls")
			local null_ls_utils = require("null-ls.utils")
			local formatting = null_ls.builtins.formatting
			local diagnostics = null_ls.builtins.diagnostics
			-- to setup format on save
			local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

			null_ls.setup({
				root_dir = null_ls_utils.root_pattern(".null-ls-root", "Makefile", ".git", "package.json"),
				sources = {
					formatting.prettierd.with({
						extra_filetypes = { "svelte" },
						filetypes = {
							"javascript",
							"javascriptreact",
							"typescript",
							"typescriptreact",
							"vue",
							"css",
							"scss",
							"less",
							"html",
							"json",
							"jsonc",
							"yaml",
							"graphql",
							"handlebars",
						},
					}), -- js/ts formatter
					formatting.stylua, -- lua formatter
					formatting.black, -- python formatter
					formatting.isort, -- python formatter
					formatting.markdownlint, -- markdown formatter
					formatting.google_java_format, -- java formatter
					diagnostics.pylint, -- python linter
					diagnostics.eslint_d.with({ -- js/ts linter
						condition = function(utils)
							return utils.root_has_file({ ".eslintrc.js", ".eslintrc.cjs" }) -- only enable if root has .eslintrc.js or .eslintrc.cjs
						end,
					}),
					diagnostics.markdownlint.with({
						extra_args = { "--disable MD013" }, -- diable rule: line length
					}), -- markdown linter
					diagnostics.ansiblelint, --ansible linter
					diagnostics.hadolint, -- dockerfile linter
				},

				-- configure format on save
				on_attach = function(current_client, bufnr)
					if current_client.supports_method("textDocument/formatting") then
						vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
						vim.api.nvim_create_autocmd("BufWritePre", {
							group = augroup,
							buffer = bufnr,
							callback = function()
								vim.lsp.buf.format({
									filter = function(client)
										--  only use null-ls for formatting instead of lsp server
										return client.name == "null-ls"
									end,
									bufnr = bufnr,
								})
							end,
						})
					end
				end,
			})
		end,
	},
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = {
			"MunifTanjim/nui.nvim",
			{ "rcarriga/nvim-notify", opts = { background_colour = "#000000" } },
		},
		opts = {
			views = {
				cmdline_popup = {
					position = {
						row = 5,
						col = "50%",
					},
					size = {
						width = 60,
						height = "auto",
					},
					border = {
						style = "none",
						padding = { 1, 2 },
					},
					win_options = {
						winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
					},
				},
				popupmenu = {
					relative = "editor",
					position = {
						row = 8,
						col = "50%",
					},
					size = {
						width = 60,
						height = 10,
					},
					border = {
						style = "rounded",
						padding = { 0, 1 },
					},
					win_options = {
						winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
					},
				},
			},
			-- cmdline = { view = "cmdline" }, -- classic command line
			lsp = {
				-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true,
				},
			},

			routes = {
				{ filter = { event = "msg_show", min_height = 20 }, view = "messages" }, -- send long messages to split
				{ filter = { event = "msg_show", find = "%d+L,%s%d+B" }, opts = { skip = true } }, -- skip save notifications
				{ filter = { event = "msg_show", find = "^%d+ more lines$" }, opts = { skip = true } }, -- skip paste notifications
				{ filter = { event = "msg_show", find = "^%d+ fewer lines$" }, opts = { skip = true } }, -- skip delete notifications
				{ filter = { event = "msg_show", find = "^%d+ lines yanked$" }, opts = { skip = true } }, -- skip yank notifications
			},
			presets = {
				bottom_search = true, -- use a classic bottom cmdline for search
				command_palette = true, -- position the cmdline and popupmenu together
				long_message_to_split = true, -- long messages will be sent to a split
				inc_rename = true, -- enables an input dialog for inc-rename.nvim
				lsp_doc_border = false, -- add a border to hover docs and signature help
			},
		},
	},

	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			{ "nvimdev/lspsaga.nvim", config = true },
			{ "antosha417/nvim-lsp-file-operations", config = true },
		},

		opts = {
			diagnostics = {
				underline = true,
				update_in_insert = false,
				virtual_text = {
					spacing = 4,
					source = "if_many",
					-- this will set set the prefix to a function that returns the diagnostics icon based on the severity
					-- this only works on a recent 0.10.0 build. Will be set to "●" when not supported
					prefix = "icons",
				},
				severity_sort = true,
			},
			inlay_hints = {
				enabled = true,
			},
		},

		config = require("custom.configs.nvim-lspconfig"),
	},

	{
		"goolord/alpha-nvim",
		event = "VimEnter",
		config = require("custom.configs.alpha-nvim"),
	},
}

return plugins
