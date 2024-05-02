-- Standard awesome library
local awful = require("awful")
local bling = require("bling")

local _M = {}
function _M.get(_)
	-- Table of layouts to cover with awful.layout.inc, order matters.
	local layouts = {
		bling.layout.centered,
		awful.layout.suit.tile,
		bling.layout.mstab,
		awful.layout.suit.floating,
		-- awful.layout.suit.tile.bottom,
		-- awful.layout.suit.tile.top,
		awful.layout.suit.fair,
		-- awful.layout.suit.spiral,
		-- awful.layout.suit.spiral.dwindle,
		awful.layout.suit.max,
		-- -- awful.layout.suit.max.fullscreen,
		-- awful.layout.suit.magnifier,
		-- awful.layout.suit.corner.nw,
		-- awful.layout.suit.corner.ne,
		-- awful.layout.suit.corner.sw,
		-- awful.layout.suit.corner.se,
		-- bling.layout.vertical,
		-- bling.layout.horizontal,
		bling.layout.equalarea,
		-- bling.layout.deck,
	}

	return layouts
end

return setmetatable({}, {
	__call = function(_, ...)
		return _M.get(...)
	end,
})
