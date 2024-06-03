local gears = require("gears")
local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup")
local lain = require("lain")
local naughty = require("naughty")
local beautiful = require("beautiful")

local _M = {}
local modkey = RC.vars.modkey
local terminal = RC.vars.terminal

-- Assuming you have a table for your global keys, you can extend it like this:
-- local globalkeys = gears.table.join(globalkeys, table.unpack(generate_navigation()))

function _M.get(_)
	local directions = {
		{ key = "h", direction = "left" },
		{ key = "j", direction = "down" },
		{ key = "k", direction = "up" },
		{ key = "l", direction = "right" },
	}

	for _, dir in ipairs(directions) do
		Globalkeys = gears.table.join(
			Globalkeys,

			awful.key({ modkey }, dir.key, function()
				awful.client.focus.global_bydirection(dir.direction)
			end, { description = "Focus " .. dir.direction, group = "client" }),

			awful.key({ modkey, "Control" }, dir.key, function()
				awful.client.swap.global_bydirection(dir.direction)
			end, { description = "Swap " .. dir.direction, group = "client" })
		)
	end

	Globalkeys = gears.table.join(
		Globalkeys,

		awful.key({ modkey }, "s", hotkeys_popup.show_help, { description = "show help", group = "awesome" }),
		awful.key({ modkey }, "Escape", awful.tag.history.restore, { description = "go back", group = "tag" }),

		awful.key({ modkey }, "u", function()
			awful.spawn.with_shell("maim -s | xclip -selection clipboard -t image/png")
		end, { description = "Screenshot to clipboard", group = "Utils" }),
		awful.key({ modkey, "Control" }, "u", function()
			awful.spawn.with_shell('maim -s ~/screenshot/$(date +"screenshot-%d-%m-%Y-%H-%M-%S.png")')
		end, { description = "Screenshot to clipboard", group = "Utils" }),

		awful.key(
			{ modkey },
			"u",
			awful.client.urgent.jumpto,
			{ description = "jump to urgent client", group = "client" }
		),
		awful.key({ modkey }, "Tab", function()
			awful.client.focus.history.previous()
			if client.focus then
				client.focus:raise()
			end
		end, { description = "go back", group = "client" }),

		-- Launcher
		awful.key({ modkey }, "a", function()
			print_client_tags()
		end, {}),

		-------------------
		-- Standard program
		awful.key({ modkey }, "y", function()
			awful.spawn('rofi -modes "run,drun" -show drun')
		end, { description = "Program Launcher", group = "Launcher" }),

		awful.key({ modkey }, "m", function()
			awful.spawn(terminal)
		end, { description = "Terminal", group = "Launcher" }),

		awful.key({ modkey }, "/", function()
			awful.spawn("qutebrowser")
		end, { description = "Browser", group = "Launcher" }),
		-------------------
		-------------------

		awful.key({ modkey }, "d", function()
			awful.client.focus.byidx(1)
		end, { description = "focus next by index", group = "client" }),
		awful.key({ modkey }, "g", function()
			awful.client.focus.byidx(-1)
		end, { description = "focus previous by index", group = "client" }),

		-----------------
		-- Media controls
		awful.key({ modkey }, "x", function()
			os.execute("playerctl previous")
		end, { description = "Previous", group = "Media" }),
		awful.key({ modkey }, "c", function()
			os.execute("playerctl play-pause")
		end, { description = "Play/Pause", group = "Media" }),
		awful.key({ modkey }, "v", function()
			os.execute("playerctl next")
		end, { description = "Next", group = "Media" }),

		awful.key({ modkey }, "w", function()
			os.execute("pamixer --decrease 5")
			require("ui.widgets.volume").update()
		end, { description = "Lower 5%", group = "Media" }),
		awful.key({ modkey }, "b", function()
			os.execute("pamixer --increase 5")
			require("ui.widgets.volume").update()
		end, { description = "Raise 5%", group = "Media" }),

		-- I don't know how to name it for now
		awful.key({ modkey, "Control" }, "r", awesome.restart, { description = "reload awesome", group = "awesome" }),
		awful.key({ modkey, "Shift" }, "q", awesome.quit, { description = "quit awesome", group = "awesome" }),

		awful.key({ modkey }, "semicolon", function()
			awful.tag.incmwfact(0.05)
		end, { description = "increase master width factor", group = "layout" }),
		awful.key({ modkey }, "comma", function()
			awful.tag.incmwfact(-0.05)
		end, { description = "decrease master width factor", group = "layout" }),

		awful.key({ modkey, "Control" }, "n", function()
			local c = awful.client.restore()
			-- Focus restored client
			if c then
				c:emit_signal("request::activate", "key.unminimize", { raise = true })
			end
		end, { description = "restore minimized", group = "client" })
	)

	return Globalkeys
end

return setmetatable({}, {
	__call = function(_, ...)
		return _M.get(...)
	end,
})
