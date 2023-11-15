local overrides = require("custom.configs.overrides")

-- FIX
-- TODO
---@type NvPluginSpec[]
local plugins = {

	-- Override plugin definition options
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{
				"jose-elias-alvarez/null-ls.nvim",
				config = function()
					require("custom.configs.null-ls")
				end,
			},
		},
		config = function()
			require("plugins.configs.lspconfig")
			require("custom.configs.lspconfig")
		end, -- Override to setup mason-lspconfig
	},

	-- override plugin configs
	{
		"williamboman/mason.nvim",
		opts = overrides.mason,
	},

	{
		"nvim-treesitter/nvim-treesitter",
		opts = overrides.treesitter,
	},

	{
		"nvim-tree/nvim-tree.lua",
		opts = overrides.nvimtree,
	},

	-- {
	-- 	"folke/which-key.nvim",
	-- 	event = "VeryLazy",
	-- 	init = overrides.whichkeyinit,
	-- 	config = overrides.whichkeyconfig,
	-- },

	-- ui
	-- {
	-- 	"catppuccin/nvim",
	-- 	lazy = false,
	-- 	name = "catppuccin",
	-- 	opts = {
	-- 		flavour = "mocha",
	-- 		transparent_background = false,
	-- 		term_colors = true,
	-- 		integrations = {
	-- 			alpha = true,
	-- 			cmp = true,
	-- 			gitsigns = true,
	-- 			treesitter = true,
	-- 			neotree = true,
	-- 			mini = {
	-- 				enabled = true,
	-- 				indentscope_color = "",
	-- 			},
	-- 			mason = true,
	-- 			notify = true,
	-- 			treesitter_context = true,
	-- 			telescope = {
	-- 				enabled = true,
	-- 				style = "nvchad",
	-- 			},
	-- 			which_key = true,
	-- 			lsp_trouble = true,
	-- 			headlines = true,
	-- 		},
	-- 	},
	-- 	config = function()
	-- 		vim.cmd([[colorscheme catppuccin]])
	-- 	end,
	-- },

	{
		"goolord/alpha-nvim",
		event = "VimEnter",
		config = require("custom.configs.alpha-nvim"),
	},

	-- editor
	{ "max397574/better-escape.nvim", event = "InsertCharPre", opts = { timeout = 300 } },

	{
		"NMAC427/guess-indent.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = require("custom.configs.guess-indent"),
	},

	{
		"mrjones2014/smart-splits.nvim",
		event = "VeryLazy",
		config = require("custom.configs.smart-splits"),
	},

	{
		"stevearc/dressing.nvim",
		lazy = true,
		init = require("custom.configs.dressing"),
	},

	{
		"folke/todo-comments.nvim",
		event = "VeryLazy",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {},
	},
}

return plugins
