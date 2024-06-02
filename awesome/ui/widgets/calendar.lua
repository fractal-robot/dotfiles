local wibox = require("wibox")
local beautiful = require("beautiful")
local lain = require("lain")
local markup = lain.util.markup
local dpi = require("beautiful.xresources").apply_dpi

return wibox.widget({
	layout = wibox.layout.align.horizontal,

	{
		widget = wibox.container.background,
		bg = beautiful.green_light,

		{
			widget = wibox.container.margin,
			left = dpi(6),
			right = dpi(6),

			{
				widget = wibox.widget.textbox,
				markup = markup.fontfg("Symbols Nerd Font 12", beautiful.bg_normal, ""),
			},
		},
	},

	{
		widget = wibox.container.background,
		bg = beautiful.green,

		{
			widget = wibox.container.margin,
			left = dpi(6),
			right = dpi(6),

			wibox.widget({
				widget = wibox.widget.textclock,
				format = markup.fg.color(beautiful.bg_normal, "%H:%M"),
			}),
		},
	},
})
