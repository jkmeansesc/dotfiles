---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
-- local highlights = require "custom.highlights"

M.ui = {
	theme = "kanagawa",
	extended_integrations = { "todo", "alpha" },
}

M.plugins = "custom.plugins"

M.mappings = require("custom.mappings")

return M
