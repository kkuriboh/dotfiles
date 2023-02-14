local wezterm = require("wezterm")

return {
	font = wezterm.font("JetBrainsMono Nerd Font Mono", { weight = "Bold" }),
	font_size = 10,
	color_scheme = "tokyonight",
	window_background_image = "/home/vanilla/Images/lainbw.jpg",
	window_background_image_hsb = {
		brightness = 0.6,
	},
	window_background_opacity = 0.95,
	text_background_opacity = 1.0,
	hide_tab_bar_if_only_one_tab = true,
}
