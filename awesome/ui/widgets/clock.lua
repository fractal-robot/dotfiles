local wibox = require("wibox")
local beautiful = require("beautiful")
local dpi = require("beautiful.xresources").apply_dpi

return wibox.widget({
	widget = wibox.container.margin,
	-- right = dpi(2),
	-- left = dpi(2),
	margins = dpi(2),

	{
		widget = wibox.container.background,
		bg = "#d79921",
		fg = "#282828",
		{
			widget = wibox.widget.textclock(),
		},
	},
})
