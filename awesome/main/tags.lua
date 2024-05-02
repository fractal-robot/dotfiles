local awful = require("awful")
local bling = require("bling")

local _M = {}

-- function _M.get(_)
-- 	tags = {}
-- 	awful.screen.connect_for_each_screen(function(s)
-- 		tags[s] = awful.tag({ "1", "2", "3", "4", "5", "6", "7", "8", "9" }, s, RC.layouts[1])
-- 	end)
-- 	return tags
-- end

function _M.get(_)
	local tags = {}

	-- local tagpairs = {
	-- 	--  names  = { "term", "net", "edit", "place", 5, 6, 7, 8, 9 },
	-- 	names = {
	-- 		"I",
	-- 		"II",
	-- 		"III",
	-- 		"IV",
	-- 		"V",
	-- 		"VI",
	-- 		"VII",
	-- 		"floating",
	-- 	},
	--
	-- 	layout = {
	-- 		RC.layouts[1],
	-- 		RC.layouts[1],
	-- 		RC.layouts[1],
	-- 		RC.layouts[1],
	-- 		RC.layouts[1],
	-- 		RC.layouts[1],
	-- 		RC.layouts[1],
	-- 		RC.layouts[4],
	-- 	},
	-- }

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
			layout = awful.layout.suit.max.fullscreen,
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
