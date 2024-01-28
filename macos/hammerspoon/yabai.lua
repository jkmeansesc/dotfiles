local yabaiOutput, _, _, _ = hs.execute("which yabai", true)
local yabai = string.gsub(yabaiOutput, "%s+", "")

local function execYabai(args)
	local command = string.format("%s %s", yabai, args)
	print(string.format("yabai: %s", command))
	os.execute(command)
end

local function alt(key, commands)
	hs.hotkey.bind({ "alt" }, key, function()
		execYabai(commands)
	end)
end

local function alt_shift(key, commands)
	hs.hotkey.bind({ "alt", "shift" }, key, function()
		execYabai(commands)
	end)
end

local function alt_ctrl(key, commands)
	hs.hotkey.bind({ "alt", "ctrl" }, key, function()
		execYabai(commands)
	end)
end

-- change window focus within space
alt("j", "-m window --focus south")
alt("k", "-m window --focus north")
alt("h", "-m window --focus west")
alt("l", "-m window --focus east")

-- change focus between external displays (left and right)
alt("w", "-m display --focus west")
alt("e", "-m display --focus east")

-- rotate layout clockwise
alt("r", "-m space --rotate 270")

-- flip along y-axis
alt("y", "-m space --mirror y-axis")

-- flip along x-axis
alt("x", "-m space --mirror x-axis")

-- toggle window float
alt("t", "-m window --toggle float --grid 4:4:1:1:2:2")

-- maximize a window
alt("f", "-m window --toggle zoom-fullscreen")

-- balance out tree of windows (resize to occupy same area)
alt("=", "-m space --balance")

-- stack config
alt("s", "-m window --stack next")
alt("n", "-m window --focus stack.next")
alt("p", "-m window --focus stack.prev")

-- swap windows
alt_ctrl("j", "-m window --swap south")
alt_ctrl("k", "-m window --swap north")
alt_ctrl("h", "-m window --swap west")
alt_ctrl("l", "-m window --swap east")

-- move window to display left and right
alt_ctrl("w", "-m window --display west display --focus west")
alt_ctrl("e", "-m window --display east display --focus east")

-- move window to prev and next space
alt_ctrl("p", "-m window --space prev")
alt_ctrl("n", "-m window --space next")

-- move window to space #
alt_ctrl("1", "-m window --space 1 space --focus 1")
alt_ctrl("2", "-m window --space 2 space --focus 2")
alt_ctrl("3", "-m window --space 3 space --focus 3")
alt_ctrl("4", "-m window --space 4 space --focus 4")
alt_ctrl("5", "-m window --space 5 space --focus 5")
alt_ctrl("6", "-m window --space 6 space --focus 6")
alt_ctrl("7", "-m window --space 7 space --focus 7")
alt_ctrl("8", "-m window --space 8 space --focus 8")
alt_ctrl("9", "-m window --space 9 space --focus 9")

-- stop/start/restart yabai
alt_ctrl("q", "--stop-service")
alt_ctrl("s", "--start-service")
alt_ctrl("r", "--restart-service")

-- warp windows
alt_shift("j", "-m window --warp south")
alt_shift("k", "-m window --warp north")
alt_shift("h", "-m window --warp west")
alt_shift("l", "-m window --warp east")
