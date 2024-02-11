local wezterm = require("wezterm")

local config = {}

-- config hot reload
config.automatically_reload_config = true

-- if true, define the keybinding yourself
config.disable_default_key_bindings = false

-- set color scheme
config.color_scheme = "Catppuccin Mocha"

-- hide tab bar
config.enable_tab_bar = false

-- hide scroll bar
config.enable_scroll_bar = false

-- set transparency
config.window_background_opacity = 0.6
config.text_background_opacity = 0.75
config.macos_window_background_blur = 20

-- set window options
config.window_close_confirmation = "AlwaysPrompt"
config.window_decorations = "RESIZE"
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

-- font settings
config.font = wezterm.font({ family = "Sarasa Fixed SC", weight = "Bold" })
config.allow_square_glyphs_to_overflow_width = "Always"
config.font_size = 20.0

-- other settings
config.scrollback_lines = 3000

return config
