local wezterm = require("wezterm")

local config = {
	-- config hot reload
	automatically_reload_config = true,

	-- if true, define the keybinding yourself
	disable_default_key_bindings = false,

	-- set color scheme
	color_scheme = "Dark+",

	-- hide tab bar
	enable_tab_bar = false,

	-- hide scroll bar
	enable_scroll_bar = false,

	-- set transparency
	window_background_opacity = 0.6,
	text_background_opacity = 0.75,
	macos_window_background_blur = 20,

	-- set window padding
	window_decorations = "RESIZE",
	window_padding = {
		left = 0,
		right = 0,
		top = 0,
		bottom = 0,
	},

	-- font settings
	font = wezterm.font({ family = "Sarasa Fixed SC", weight = "Bold" }),
	allow_square_glyphs_to_overflow_width = "Always",
	font_size = 19.5,
}

return config
