local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local dpi = require("beautiful.xresources").apply_dpi
-- local naughty = require("naughty")

local _M = {}

function _M.setup()
	local textbox = wibox.widget({
		widget = wibox.widget.textbox,
		align = "center",
		valign = "center",
		text = "",
	})

	awful.spawn.with_line_callback("playerctl --follow metadata --format '{{ artist }} - {{ title }}'", {
		stdout = function(line)
			-- naughty.notify({ text = line })
			textbox.text = line
		end,
	})

	local playerctl = wibox.widget({
		widget = wibox.container.margin,
		right = dpi(2),
		left = dpi(2),
		{
			widget = wibox.container.background,
			bg = beautiful.bar_bg_alt,
			textbox,
		},
	})

	return playerctl
end

return _M
