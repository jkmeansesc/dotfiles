local wezterm = require("wezterm")

local config = {}

-- config hot reload
config.automatically_reload_config = true

-- if true, define the keybinding yourself
config.disable_default_key_bindings = false

-- set color scheme
config.color_scheme = "Catppuccin"

-- hide tab bar
config.enable_tab_bar = false

-- hide scroll bar
config.enable_scroll_bar = false

-- set transparency
config.window_background_opacity = 0.8
config.text_background_opacity = 0.30

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
config.font = wezterm.font("Sarasa Fixed SC", { weight = "DemiBold", stretch = "Normal", style = "Normal" }) -- /usr/share/fonts/sarasa-gothic/Sarasa-SemiBold.ttc index=37 variation=0, FontConfig
config.allow_square_glyphs_to_overflow_width = "Always"
config.font_size = 12.0

-- other settings
config.scrollback_lines = 3000

return config
