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
}

return plugins
