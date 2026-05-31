-- hyprland.lua — migrated from hyprlang to Lua (0.55+)
-- https://wiki.hypr.land/Configuring/Start/

------------------
---- MONITORS ----
------------------

-- DP-3 with HDR and 10-bit color
hl.monitor({
	output = "DP-3",
	mode = "preferred",
	-- mirror = "eDP-1",
	-- position = "auto",
	position = "-1920x-540", -- Kokalqne
	scale = "auto",
	bitdepth = 10,
	cm = "hdr",
})

-------------------
---- AUTOSTART ----
-------------------

hl.on("hyprland.start", function()
	hl.exec_cmd("hyprlock")
	hl.exec_cmd("hyprpaper")
	hl.exec_cmd("waybar")
	hl.exec_cmd("pidof -x battery-alarm.sh || /home/debelbot/.local/scripts/battery-alarm.sh")
	hl.exec_cmd("gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'")
end)

-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")
hl.env("GTK_THEME", "WhiteSur-Dark")

-----------------------
---- LOOK AND FEEL ----
-----------------------

hl.config({
	general = {
		gaps_in = 2,
		gaps_out = 6,
		border_size = 2,
		col = {
			active_border = { colors = { "rgba(33ccff55)", "rgba(00ff9955)" }, angle = 45 },
			inactive_border = "rgba(595959aa)",
		},
		resize_on_border = false,
		allow_tearing = false,
		layout = "dwindle",
	},

	decoration = {
		rounding = 10,
		rounding_power = 2,
		active_opacity = 1.0,
		inactive_opacity = 1.0,
		shadow = {
			enabled = true,
			range = 4,
			render_power = 3,
			color = 0xee1a1a1a,
		},
		blur = {
			enabled = true,
			size = 3,
			passes = 1,
			vibrancy = 0.1696,
		},
	},

	animations = {
		enabled = true,
	},

	dwindle = {
		preserve_split = true,
		force_split = 2,
	},

	master = {
		new_status = "master",
		orientation = "right",
	},

	misc = {
		force_default_wallpaper = 0,
		disable_hyprland_logo = true,
		disable_splash_rendering = true,
	},

	ecosystem = {
		no_update_news = true,
		no_donation_nag = true,
	},
})

-- Animations
hl.curve("myBezier", { type = "bezier", points = { { 0.05, 0.9 }, { 0.1, 1.05 } } })

hl.animation({ leaf = "windows", enabled = true, speed = 7, bezier = "myBezier" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 7, bezier = "default", style = "popin 80%" })
hl.animation({ leaf = "border", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "borderangle", enabled = true, speed = 8, bezier = "default" })
hl.animation({ leaf = "fade", enabled = true, speed = 7, bezier = "default" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 3, bezier = "default", style = "fade" })

---------------
---- INPUT ----
---------------

hl.config({
	input = {
		kb_layout = "us,bg",
		kb_variant = ",phonetic",
		kb_model = "",
		kb_options = "caps:escape",
		kb_rules = "",
		follow_mouse = 1,
		sensitivity = 0,
		touchpad = {
			natural_scroll = false,
		},
	},
})

hl.device({
	name = "mosart-semi.-2.4g-wireless-mouse",
	sensitivity = -1,
})

---------------------
---- KEYBINDINGS ----
---------------------

local terminal = "kitty"
local browser = "zen-browser"
local menu = "wofi --show drun"

local function kb_helper(main, ...)
	local bind = main
	local args = table.pack(...)
	for i = 1, args.n do
		bind = bind .. " + " .. args[i]
	end

	return bind
end

local function kb_alt(...)
	return kb_helper("ALT", ...)
end

local function kb_alt_shift(...)
	return kb_helper("SHIFT + ALT", ...)
end

local function kb_super(...)
	return kb_helper("SUPER", ...)
end

local function kb_super_shift(...)
	return kb_helper("SHIFT + SUPER", ...)
end

-- Terminal-aware copy/paste
local terminals = { kitty = true, alacritty = true, ghostty = true }

local function is_terminal()
	local w = hl.get_active_window()
	return w ~= nil and terminals[w.class:lower()] == true
end

hl.bind(kb_super("c"), function()
	if is_terminal() then
		hl.dispatch(hl.dsp.send_shortcut({ mods = "CTRL SHIFT", key = "c", window = "activewindow" }))
	else
		hl.dispatch(hl.dsp.send_shortcut({ mods = "CTRL", key = "c", window = "activewindow" }))
	end
end, { repeating = true })

hl.bind(kb_super("v"), function()
	if is_terminal() then
		hl.dispatch(hl.dsp.send_shortcut({ mods = "CTRL SHIFT", key = "v", window = "activewindow" }))
	else
		hl.dispatch(hl.dsp.send_shortcut({ mods = "CTRL", key = "v", window = "activewindow" }))
	end
end, { repeating = true })

hl.bind(
	kb_super("x"),
	hl.dsp.send_shortcut({ mods = "CTRL", key = "x", window = "activewindow" }),
	{ repeating = true }
)

hl.bind(
	kb_super("a"),
	hl.dsp.send_shortcut({ mods = "CTRL", key = "a", window = "activewindow" }),
	{ repeating = true }
)

hl.bind(
	kb_super("z"),
	hl.dsp.send_shortcut({ mods = "CTRL", key = "z", window = "activewindow" }),
	{ repeating = true }
)

-- Core
hl.bind(kb_alt("return"), hl.dsp.exec_cmd(terminal))
hl.bind(kb_alt("space"), hl.dsp.exec_cmd(menu))
hl.bind(kb_alt("semicolon"), hl.dsp.exec_cmd(browser))
hl.bind(kb_alt("f"), hl.dsp.window.fullscreen())
hl.bind(kb_alt_shift("Tab"), function()
	hl.dispatch(hl.dsp.workspace.move({ monitor = "+1" }))
	hl.exec_cmd("hyprctl reload")
end)
hl.bind(kb_super("space"), hl.dsp.exec_cmd(menu))
hl.bind(kb_super("q"), hl.dsp.window.close())
hl.bind("CTRL + SUPER + l", hl.dsp.exec_cmd("hyprlock & disown && systemctl suspend"))

-- Keyboard layout & screenshot
hl.bind(kb_alt("F11"), hl.dsp.exec_cmd("hyprctl switchxkblayout all next"))
hl.bind(kb_super_shift("5"), hl.dsp.exec_cmd("hyprshot -m region"))

-- Layout switching
local layouts = { "dwindle", "scrolling", "monocle" }

local function cycle_layouts_helper(dir)
	return function()
		local monitor = hl.get_active_monitor().name
		local layout = hl.get_active_workspace().tiled_layout

		local layout_index = 1
		for i, l in ipairs(layouts) do
			if l == layout then
				layout_index = i
				break
			end
		end

		local next_index
		if dir == "next" then
			next_index = layout_index % #layouts + 1
		else
			next_index = (layout_index - 2) % #layouts + 1
		end

		local next_layout = layouts[next_index]

		hl.workspace_rule({ workspace = "m[" .. monitor .. "]", layout = next_layout })
	end
end

hl.bind(kb_alt("slash"), cycle_layouts_helper("next"))
hl.bind(kb_alt("period"), cycle_layouts_helper("prev"))

-- Workspaces
for i = 1, 10 do
	local key = i % 10
	hl.bind(kb_alt(key), hl.dsp.focus({ workspace = i }))
	hl.bind(kb_alt_shift(key), hl.dsp.window.move({ workspace = i }))
	hl.bind(kb_alt("SUPER", key), hl.dsp.window.move({ workspace = i, follow = false }))
end

-- directions - move and focus
local directions = {
	{
		keys = { "h", "left" },
		win_opts = { direction = "l" },
		ws_opts = { workspace = "r-1" },
		resize_opts = { x = -20, y = 0, relative = true },
		monocle_opts = "cyclenext",
	},
	{
		keys = { "l", "right" },
		win_opts = { direction = "r" },
		ws_opts = { workspace = "r+1" },
		resize_opts = { x = 20, y = 0, relative = true },
		monocle_opts = "cycleprev",
	},
	{
		keys = { "j", "down" },
		win_opts = { direction = "d" },
		ws_opts = { workspace = "r-1" },
		resize_opts = { x = 0, y = 20, relative = true },
		monocle_opts = "cyclenext",
	},
	{
		keys = { "k", "up" },
		win_opts = { direction = "u" },
		ws_opts = { workspace = "r+1" },
		resize_opts = { x = 0, y = -20, relative = true },
		monocle_opts = "cycleprev",
	},
}

local function focus_win_helper(opts)
	return function()
		local layout = hl.get_active_workspace().tiled_layout

		if layout == "scrolling" or layout == "dwindle" then
			hl.dispatch(hl.dsp.focus(opts.win_opts))
		end

		if layout == "monocle" then
			hl.dispatch(hl.dsp.layout(opts.monocle_opts))
		end
	end
end

local function move_win_helper(opts)
	return function()
		local layout = hl.get_active_workspace().tiled_layout

		if layout == "scrolling" or layout == "monocle" then
			hl.dispatch(hl.dsp.window.swap(opts))
		end

		if layout == "dwindle" then
			hl.dispatch(hl.dsp.window.move(opts))
		end
	end
end

for _, dir in ipairs(directions) do
	for _, key in ipairs(dir.keys) do
		hl.bind(kb_alt(key), focus_win_helper(dir))
		hl.bind(kb_alt_shift(key), move_win_helper(dir.win_opts))
		hl.bind(kb_super_shift(key), hl.dsp.focus(dir.ws_opts))
	end
end

-- Resize submap
hl.bind(kb_alt("r"), hl.dsp.submap("resize"))

hl.define_submap("resize", function()
	for _, dir in ipairs(directions) do
		for _, key in ipairs(dir.keys) do
			hl.bind(kb_alt(key), hl.dsp.window.resize(dir.resize_opts), { repeating = true })
		end
	end

	hl.bind("Escape", hl.dsp.submap("reset"))
end)

-- Media / brightness
hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMicMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

hl.workspace_rule({ workspace = "m[eDP-1]", layout = "scrolling" })
hl.workspace_rule({ workspace = "m[DP-1]", layout = "dwindle" })
hl.workspace_rule({ workspace = "m[DP-3]", layout = "dwindle" })
