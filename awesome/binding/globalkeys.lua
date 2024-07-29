local gears = require("gears")
local awful = require("awful")
local lain = require("lain")
local beautiful = require("beautiful")

local _M = {}
local modkey = RC.vars.modkey
local terminal = RC.vars.terminal

local globalkeys

local term_scratch = lain.util.quake({
	app = "kitty",
	name = "kitty_scratchpad",
	argname = "--class kitty_scratchpad",
	followtag = true,
	visible = true,

	height = 0.75,
	width = 0.5,

	vert = "center",
	horiz = "center",

	border = beautiful.border_width,
})

function _M.get(_)
	local directions = {
		{ key = "h", direction = "left" },
		{ key = "j", direction = "down" },
		{ key = "k", direction = "up" },
		{ key = "l", direction = "right" },
	}

	for _, dir in ipairs(directions) do
		globalkeys = gears.table.join(
			globalkeys,

			-- Focus client by direction
			awful.key({ modkey }, dir.key, function()
				awful.client.focus.global_bydirection(dir.direction)
			end, { description = "Focus " .. dir.direction, group = "Focus" }),

			-- Swap clients by direction
			awful.key({ modkey, "Control" }, dir.key, function()
				awful.client.swap.global_bydirection(dir.direction)
			end, { description = "Swap " .. dir.direction, group = "Layout" })
		)
	end

	globalkeys = gears.table.join(
		globalkeys,

		-- Focus client by index
		awful.key({ modkey, "Shift" }, "l", function()
			awful.client.focus.byidx(1)
		end, { description = "focus next by index", group = "Focus" }),
		awful.key({ modkey, "Shift" }, "h", function()
			awful.client.focus.byidx(-1)
		end, { description = "focus previous by index", group = "Focus" }),

		-- Resize master width factor
		awful.key({ modkey, "Shift" }, "k", function()
			awful.tag.incmwfact(0.05)
		end, { description = "increase master width factor", group = "Layout" }),
		awful.key({ modkey, "Shift" }, "j", function()
			awful.tag.incmwfact(-0.05)
		end, { description = "decrease master width factor", group = "Layout" }),

		-- Screenshots
		awful.key({ modkey }, "y", function()
			awful.spawn.with_shell("maim -s | xclip -selection clipboard -t image/png")
		end, { description = "Screenshot to clipboard", group = "Utils" }),
		awful.key({ modkey, "Shift" }, "y", function()
			awful.spawn.with_shell('maim -s ~/documents/screenshots/$(date +"screenshot-%d-%m-%Y-%H-%M-%S.png")')
		end, { description = "Screenshot to clipboard", group = "Utils" }),

		-- Standard program
		awful.key({ modkey }, "o", function()
			awful.spawn('rofi -modes "run,drun" -show drun', { tag = awful.screen.focused().selected_tag })
		end, { description = "Program Launcher", group = "Launcher" }),

		awful.key({ modkey }, "i", function()
			awful.spawn(terminal, { tag = awful.screen.focused().selected_tag })
		end, { description = "Terminal", group = "Launcher" }),

		awful.key({ modkey }, "u", function()
			awful.spawn("brave", { tag = awful.screen.focused().selected_tag })
		end, { description = "Browser", group = "Launcher" }),

		-- Standard scratchpads
		awful.key({ modkey }, ",", function()
			term_scratch:toggle()
		end, { description = "Terminal scratchpad", group = "Launcher" }),

		-- Media controls
		awful.key({ modkey, "Shift" }, "x", function()
			os.execute("playerctl previous")
		end, { description = "Previous", group = "Media" }),

		awful.key({ modkey }, "c", function()
			os.execute("playerctl play-pause")
		end, { description = "Play/Pause", group = "Media" }),

		awful.key({ modkey, "Shift" }, "v", function()
			os.execute("playerctl next")
		end, { description = "Next", group = "Media" }),

		-- Volume controls
		awful.key({ modkey }, "x", function()
			os.execute("pamixer --decrease 5")
			require("ui.widgets.volume").update()
		end, { description = "Lower 5%", group = "Volume" }),

		awful.key({ modkey, "Shift" }, "c", function()
			os.execute("pamixer --toggle-mute")
			require("ui.widgets.volume").update()
		end, { description = "Toggle mute", group = "Volume" }),

		awful.key({ modkey }, "v", function()
			os.execute("pamixer --increase 5")
			require("ui.widgets.volume").update()
		end, { description = "Raise 5%", group = "Volume" }),

		awful.key({ modkey }, "w", function()
			require("ui.popup-info").show()
		end, { description = "lskjdflksjdf", group = "jlksdfjklsdf" }),

		------------------------------------------

		awful.key({ modkey, "Control" }, "n", function()
			local c = awful.client.restore()
			-- Focus restored client
			if c then
				c:emit_signal("request::activate", "key.unminimize", { raise = true })
			end
		end, { description = "restore minimized", group = "client" })
	)

	return globalkeys
end

return setmetatable({}, {
	__call = function(_, ...)
		return _M.get(...)
	end,
})
