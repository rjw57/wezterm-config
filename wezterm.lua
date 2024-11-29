local wezterm = require("wezterm")
local mux = wezterm.mux

local config = wezterm.config_builder()

-- Startup behaviour
wezterm.on("gui-startup", function(cmd)
	local tab, pane, window = mux.spawn_window(cmd or {})
	window:gui_window():maximize()
end)

-- Text
config.font = wezterm.font_with_fallback({
	"Flexi IBM VGA True",
	{ family = "Symbols Nerd Font Mono", scale = 0.75 },
})
config.font_dirs = { wezterm.config_dir .. "/fonts" }
config.font_locator = "ConfigDirsOnly"
config.font_size = 14
config.bold_brightens_ansi_colors = "BrightOnly"

-- Disable the auto-generated bold font.
config.font_rules = {
	{ intensity = "Bold", font = config.font },
	{ intensity = "Half", font = config.font },
}

-- Colours
config.color_scheme = "Moonfly (Gogh)"

-- Tab bar
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true

-- Window
config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"

return config
