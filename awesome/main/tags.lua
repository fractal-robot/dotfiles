local awful = require("awful")
local bling = require("bling")

local _M = {}

function _M.get(_)
	local tags = {}

	awful.screen.connect_for_each_screen(function(s)
		-- Each screen has its own tag table.
		-- tags[s] = awful.tag(tagpairs.names, s, tagpairs.layout)

		awful.tag.add("I centered", {
			screen = screen[s],
			layout = bling.layout.centered,
			index = 1,
		})
		awful.tag.add("II centered", {
			screen = screen[s],
			layout = bling.layout.centered,
			index = 2,
		})
		awful.tag.add("maximized", {
			screen = screen[s],
			-- layout = awful.layout.suit.max.fullscreen,
			layout = awful.layout.suit.max,
			index = 3,
		})
		awful.tag.add("square", {
			screen = screen[s],
			-- layout = awful.layout.suit.floating,
			layout = awful.layout.suit.fair,
			index = 4,
		})

		awful.tag.add("floating", {
			screen = screen[s],
			-- layout = awful.layout.suit.floating,
			layout = awful.layout.suit.floating,
			index = 5,
		})
	end)

	return tags
end

return setmetatable({}, {
	__call = function(_, ...)
		return _M.get(...)
	end,
})
