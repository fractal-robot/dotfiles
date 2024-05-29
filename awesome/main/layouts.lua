-- Standard awesome library
local awful = require("awful")
local bling = require("bling")
local lain = require("lain")

local _M = {}
function _M.get(_)
	-- Table of layouts to cover with awful.layout.inc, order matters.
	local layouts = {
		lain.layout.centerwork,
		bling.layout.centered,
		awful.layout.suit.tile,
		bling.layout.mstab,
		awful.layout.suit.floating,
		awful.layout.suit.fair,
		awful.layout.suit.max,
		bling.layout.equalarea,
	}

	return layouts
end

return setmetatable({}, {
	__call = function(_, ...)
		return _M.get(...)
	end,
})
