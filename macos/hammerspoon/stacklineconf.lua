local stackline = require("stackline")

-- HACK: Fix ** Warning:   LuaSkin: hs.task:launch() Unable to launch hs.task process: launch path not accessible
-- yabai executable is hard coded in stackline, resulting in icons UI not showing up.
local conf = require("stackline.conf")
local yabaiOutput, _, _, _ = hs.execute("which yabai", true)
local yabai = string.gsub(yabaiOutput, "%s+", "")
conf.paths.yabai = yabai
stackline:init()

-- bind alt+ctrl+t to toggle stackline icons
hs.hotkey.bind({ "alt", "ctrl" }, "t", function()
	stackline.config:toggle("appearance.showIcons")
end)
