local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local lain = require("lain")
local markup = lain.util.markup
local dpi = require("beautiful.xresources").apply_dpi

return wibox.widget({
	layout = wibox.layout.align.horizontal,

	{
		widget = wibox.container.background,
		bg = beautiful.blue_light,

		{
			widget = wibox.container.margin,
			left = dpi(6),
			right = dpi(6),

			{
				widget = wibox.widget.textbox,
				markup = markup.fontfg("Symbols Nerd Font 11", beautiful.bg_normal, ""),
			},
		},
	},

	{
		widget = wibox.container.background,
		bg = beautiful.blue,

		{
			widget = wibox.container.margin,
			left = dpi(6),
			right = dpi(6),

			{
				widget = awful.widget.watch("cat /tmp/backup.status", 10, function(widget, stdout)
					if stdout == nil then
						return
					end

					stdout = stdout:match("^%s*(.-)%s*$")
					widget:set_markup(
						"<span foreground='"
							.. beautiful.bg_normal
							.. "'>"
							.. stdout:gsub("^%l", string.upper)
							.. "</span>"
					)
				end),
			},
		},
	},
})
