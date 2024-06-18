local gears = require("gears")
local awful = require("awful")

local _M = {}
local modkey = RC.vars.modkey

function _M.get(_)
	local clientkeys = gears.table.join(
		awful.key({ modkey }, "s", function(c)
			c:kill()
		end, { description = "Close", group = "Client" }),

		awful.key({ modkey }, "f", function(c)
			c:swap(awful.client.getmaster())
		end, { description = "Move to master", group = "Client" }),

		awful.key({ modkey }, "d", function(c)
			c.maximized = not c.maximized
			c:raise()
		end, { description = "Toggle maximized", group = "Client" }),

		awful.key({ modkey, "Shift" }, "f", function(c)
			c.fullscreen = not c.fullscreen
			c:raise()
		end, { description = "Toggle fullscreen", group = "Client" }),

		------------------------------

		awful.key({ modkey }, "o", function(c)
			c:move_to_screen()
		end, { description = "Move to screen", group = "Client" })
	)

	return clientkeys
end

return setmetatable({}, {
	__call = function(_, ...)
		return _M.get(...)
	end,
})
