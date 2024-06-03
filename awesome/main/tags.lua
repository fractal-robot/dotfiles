local awful = require("awful")
local lain = require("lain")
local bling = require("bling")

local _M = {}

function _M.get(_)
	local tags = {}

	awful.screen.connect_for_each_screen(function(s)
		-- Each screen has its own tag table.
		-- tags[s] = awful.tag(tagpairs.names, s, tagpairs.layout)

		-- layout = bling.layout.centered,
		-- layout = awful.layout.suit.max,
		-- layout = awful.layout.suit.floating,
		-- layout = awful.layout.suit.fair,

		awful.tag.add("󱓻", {
			screen = screen[s],
			layout = lain.layout.centerwork,
			index = 1,
		})
		awful.tag.add("", {
			screen = screen[s],
			layout = lain.layout.centerwork,
			index = 2,
		})
		awful.tag.add("󰎚", {
			screen = screen[s],
			layout = lain.layout.centerwork,
			index = 3,
		})
	end)

	return tags
end

return setmetatable({}, {
	__call = function(_, ...)
		return _M.get(...)
	end,
})
