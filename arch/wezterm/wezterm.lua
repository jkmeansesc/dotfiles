local wezterm = require("wezterm")

local config = {}

config.disable_default_key_bindings = false
config.automatically_reload_config = true
config.term = "xterm-256color"
config.animation_fps = 60
config.max_fps = 60
config.enable_wayland = true

config.enable_scroll_bar = false
config.enable_tab_bar = false
config.color_scheme = "Catppuccin Mocha"

-- https://github.com/wez/wezterm/issues/2756
config.webgpu_power_preference = "HighPerformance"

-- set transparency
config.window_background_opacity = 0.7
config.text_background_opacity = 0.5

-- set window options
config.window_close_confirmation = "AlwaysPrompt"
-- config.window_decorations = "RESIZE"
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

-- font settings
config.font = wezterm.font("Sarasa Fixed SC", { weight = "DemiBold", stretch = "Normal", style = "Normal" }) -- /usr/share/fonts/sarasa-gothic/Sarasa-SemiBold.ttc index=37 variation=0, FontConfig
config.allow_square_glyphs_to_overflow_width = "Always"
config.font_size = 10.0

-- cursor
config.cursor_blink_ease_in = "Constant"
config.cursor_blink_ease_out = "Constant"
config.default_cursor_style = "BlinkingBlock"
config.cursor_blink_rate = 700

-- other settings
config.scrollback_lines = 3000

return config
