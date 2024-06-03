local gears = require("gears")
local awful = require("awful")

local _M = {}
local modkey = RC.vars.modkey

function _M.get(globalkeys)
	-- Bind all key numbers to tags.
	-- Be careful: we use keycodes to make it work on any keyboard layout.
	-- This should map on the top row of your keyboard, usually 1 to 9.

	local keys = { "z", "e", "r" }

	for i = 1, 3 do
		globalkeys = gears.table.join(
			globalkeys,

			awful.key({ modkey }, keys[i], function()
				local screen = awful.screen.focused()
				local tag = screen.tags[i]
				if tag then
					tag:view_only()
				end
			end, { description = "View tag " .. i, group = "tag" }),

			awful.key({ modkey, "Control" }, keys[i], function()
				if client.focus then
					local tag = client.focus.screen.tags[i]
					if tag then
						client.focus:move_to_tag(tag)
					end
				end
			end, { description = "Move focused client to tag " .. i, group = "tag" }),

			awful.key({ modkey, "Control", "Shift" }, keys[i], function()
				local screen = awful.screen.focused()
				local tag = screen.tags[i]
				if tag then
					awful.tag.viewtoggle(tag)
				end
			end, { description = "Toggle tag #" .. i, group = "tag" }),

			awful.key({ modkey, "Shift" }, keys[i], function()
				if client.focus then
					local tag = client.focus.screen.tags[i]
					if tag then
						client.focus:toggle_tag(tag)
					end
				end
			end, { description = "Toggle focused client on tag " .. i, group = "tag" })
		)
	end

	return globalkeys
end

return setmetatable({}, {
	__call = function(_, ...)
		return _M.get(...)
	end,
})
