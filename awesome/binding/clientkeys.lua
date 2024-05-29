local gears = require("gears")
local awful = require("awful")

local _M = {}
local modkey = RC.vars.modkey

function _M.get(_)
	local clientkeys = gears.table.join(
		awful.key({ modkey }, ".", function(c)
			c.fullscreen = not c.fullscreen
			c:raise()
		end, { description = "toggle fullscreen", group = "client" }),

		awful.key(
			{ modkey, "Control" },
			"space",
			awful.client.floating.toggle,
			{ description = "toggle floating", group = "client" }
		),

		awful.key({ modkey, "Shift" }, "c", function(c)
			c:kill()
		end, { description = "close", group = "client" }),

		awful.key({ modkey }, "Return", function(c)
			c:swap(awful.client.getmaster())
		end, { description = "Move to master", group = "client" }),

		awful.key({ modkey }, "o", function(c)
			c:move_to_screen()
		end, { description = "move to screen", group = "client" }),

		awful.key({ modkey }, "n", function(c)
			c.minimized = true
		end, { description = "Minimize", group = "client" }),

		awful.key({ modkey }, "i", function(c)
			c.maximized = not c.maximized
			c:raise()
		end, { description = "(un)Maximize", group = "client" })
	)

	return clientkeys
end

return setmetatable({}, {
	__call = function(_, ...)
		return _M.get(...)
	end,
})
