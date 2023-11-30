---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
-- local highlights = require "custom.highlights"

M.ui = {
	theme = "onedark",
	statusline = {
		theme = "vscode_colored", -- default/vscode/vscode_colored/minimal

		-- default/round/block/arrow (separators work only for "default" statusline theme;
		-- round and block will work for the minimal theme only)
		-- separator_style = "default",
		-- overriden_modules = nil,
	},
	nvdash = {
		load_on_startup = true,
	},
	extended_integrations = { "todo" },
}

M.plugins = "custom.plugins"

M.mappings = require("custom.mappings")

return M
