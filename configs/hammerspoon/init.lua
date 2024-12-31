-- ---------------------------------------------------------------
-- Utility Functions
-- ---------------------------------------------------------------

local function alt(key, action)
	hs.hotkey.bind({ "alt" }, key, function()
		action()
	end)
end

local function alt_shift(key, action)
	hs.hotkey.bind({ "alt", "shift" }, key, function()
		action()
	end)
end

local function alt_ctrl(key, action)
	hs.hotkey.bind({ "alt", "ctrl" }, key, function()
		action()
	end)
end

local function move_to_unit(layout)
	return function()
		hs.window.focusedWindow():moveToUnit(layout)
	end
end

local function launch_or_focus(app)
	return function()
		hs.application.launchOrFocus(app)
	end
end

-- ---------------------------------------------------------------
-- General
-- ---------------------------------------------------------------

alt_shift("R", function()
	hs.reload()
end)

-- ---------------------------------------------------------------
-- Window Management
-- ---------------------------------------------------------------

local layouts = {
	left_half = { 0.015, 0.02, 0.4775, 0.96 },
	right_half = { 0.5075, 0.02, 0.4775, 0.96 },
	top_half = { 0.015, 0.02, 0.97, 0.47 },
	bottom_half = { 0.015, 0.5075, 0.97, 0.47 },
	top_left = { 0.015, 0.02, 0.47, 0.47 },
	top_right = { 0.5, 0, 0.5, 0.5 },
	bottom_left = { 0, 0.5, 0.5, 0.5 },
	bottom_right = { 0.5, 0.5, 0.5, 0.5 },
	full_screen = { 0.015, 0.02, 0.97, 0.96 },
}

alt_ctrl("H", move_to_unit(layouts.left_half))
alt_ctrl("L", move_to_unit(layouts.right_half))
alt_ctrl("K", move_to_unit(layouts.top_half))
alt_ctrl("J", move_to_unit(layouts.bottom_half))
alt_ctrl("U", move_to_unit(layouts.top_left))
alt_ctrl("I", move_to_unit(layouts.top_right))
alt_ctrl("N", move_to_unit(layouts.bottom_left))
alt_ctrl("M", move_to_unit(layouts.bottom_right))
alt("F", move_to_unit(layouts.full_screen))
alt("C", function()
	hs.window.focusedWindow():centerOnScreen()
end)

alt("B", launch_or_focus("Arc"))
alt("T", launch_or_focus("Ghostty"))
alt("D", launch_or_focus("Discord"))
alt("M", launch_or_focus("Mail"))
alt("C", launch_or_focus("ChatGPT"))

local switcher = hs.window.switcher.new(hs.window.filter.new():setCurrentSpace(true):setDefaultFilter({})) -- include minimized/hidden windows, current Space only

alt("L", function()
	switcher:next()
end)
alt("H", function()
	switcher:previous()
end)
