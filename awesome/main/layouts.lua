-- Standard awesome library
local awful = require("awful")
local lain = require("lain")

local _M = {}
function _M.get(_)
	-- Table of layouts to cover with awful.layout.inc, order matters.
	local layouts = {
		lain.layout.centerwork,
		awful.layout.suit.tile,
		awful.layout.suit.floating,
		awful.layout.suit.fair,
		awful.layout.suit.max,
	}

	return layouts
end

return setmetatable({}, {
	__call = function(_, ...)
		return _M.get(...)
	end,
})
