-- load yabai keybinding
require("yabai")

-- load stackline
local stackline = require("stackline")
stackline:init()

-- bind alt+ctrl+t to toggle stackline icons
hs.hotkey.bind({ "alt", "ctrl" }, "t", function()
	stackline.config:toggle("appearance.showIcons")
end)
