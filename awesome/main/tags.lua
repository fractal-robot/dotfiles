local awful = require("awful")
local lain = require("lain")

local _M = {}

-- local layout = lain.layout.centerwork
local layout = awful.layout.suit.tile

function _M.get(_)
	local tags = {}

	awful.screen.connect_for_each_screen(function(s)
		-- Each screen has its own tag table.
		-- tags[s] = awful.tag(tagpairs.names, s, tagpairs.layout)

		-- layout = awful.layout.suit.max,
		-- layout = awful.layout.suit.floating,
		-- layout = awful.layout.suit.fair,

		awful.tag.add("󱓻", {
			screen = screen[s],
			layout = layout,
			index = 1,
		})
		awful.tag.add("", {
			screen = screen[s],
			layout = layout,
			index = 2,
		})
		awful.tag.add("󰎚", {
			screen = screen[s],
			layout = layout,
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
