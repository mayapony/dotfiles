local wezterm = require("wezterm")

local function font_with_fallback(name, params)
	local names = { name, "Apple Color Emoji", "Font Awesome" }
	return wezterm.font_with_fallback(names, params)
end

local font_name = "Hack Nerd Font"

local config = {
	-- OpenGL for GPU acceleration, Software for CPU
	-- front_end = "OpenGL",
	front_end = "OpenGL",
	default_cursor_style = "BlinkingBlock",
	-- Font config
	font = font_with_fallback(font_name),
	font_rules = {
		{
			italic = true,
			font = font_with_fallback(font_name, { italic = true }),
		},
		{
			italic = false,
			font = font_with_fallback(font_name, { italic = false }),
		},
		{
			intensity = "Bold",
			font = font_with_fallback(font_name, { bold = true }),
		},
	},
	warn_about_missing_glyphs = false,
	font_size = 16,
	line_height = 1.2,
	-- dpi = 157.35,
	-- X11
	enable_wayland = true,
	-- Keybinds
	disable_default_key_bindings = true,
	keys = {
		-- standard copy/paste bindings
		{
			key = "x",
			mods = "CTRL",
			action = "ActivateCopyMode",
		},
		{
			key = "v",
			mods = "CTRL|SHIFT",
			action = wezterm.action({ PasteFrom = "Clipboard" }),
		},
		{
			key = "c",
			mods = "CTRL|SHIFT",
			action = wezterm.action({ CopyTo = "ClipboardAndPrimarySelection" }),
		},
	},
	-- Aesthetic Night Colorscheme
	bold_brightens_ansi_colors = true,
	-- Padding
	window_padding = {
		left = 15,
		right = 15,
		top = 10,
		bottom = 0,
	},
	-- Tab Bar
	enable_tab_bar = false,
	-- General
	automatically_reload_config = true,
	window_background_opacity = 1,
	window_close_confirmation = "NeverPrompt",
}

-- Use the defaults as a base
config.hyperlink_rules = wezterm.default_hyperlink_rules()

-- make task numbers clickable
-- the first matched regex group is captured in $1.
table.insert(config.hyperlink_rules, {
	regex = [[\b[tt](\d+)\b]],
	format = "https://example.com/tasks/?t=$1",
})

-- make username/project paths clickable. this implies paths like the following are for github.
-- ( "nvim-treesitter/nvim-treesitter" | wbthomason/packer.nvim | wez/wezterm | "wez/wezterm.git" )
-- as long as a full url hyperlink regex exists above this it should not match a full url to
-- github or gitlab / bitbucket (i.e. https://gitlab.com/user/project.git is still a whole clickable url)
table.insert(config.hyperlink_rules, {
	regex = [[["]?([\w\d]{1}[-\w\d]+)(/){1}([-\w\d\.]+)["]?]],
	format = "https://www.github.com/$1/$3",
})

function scheme_for_appearance(appearance)
	local themes = {
		Catppuccin = {
			light = "Catppuccin Latte",
			dark = "Catppuccin Mocha",
		},
		RosePine = {
			light = "rose-pine-dawn",
			dark = "rose-pin-moon",
		},
	}
	local theme = themes["RosePine"]
	if appearance:find("Dark") then
		return theme.dark
	else
		return theme.light
	end
end

wezterm.on("window-config-reloaded", function(window, pane)
	local overrides = window:get_config_overrides() or {}
	local appearance = window:get_appearance()
	local scheme = scheme_for_appearance(appearance)
	if overrides.color_scheme ~= scheme then
		overrides.color_scheme = scheme
		window:set_config_overrides(overrides)
	end
end)

return config
