local wibox = require("wibox")
local awful = require("awful")
local gears = require("gears")
local dpi = require("beautiful.xresources").apply_dpi

Dashboard = awful.popup({
	widget = {
		-- spacing = dpi(-6),

		layout = wibox.layout.fixed.vertical,

		{
			layout = wibox.layout.fixed.horizontal,

			{
				widget = wibox.container.margin,
				margins = 10,
				{
					widget = wibox.container.background,
					bg = "#d79921",
					fg = "#282828",
					{
						widget = wibox.container.margin,
						margins = 10,
						{
							format = '<span font="Roboto Bold 16">%H </span><span font="Roboto Bold 20">%M</span>',
							widget = wibox.widget.textclock,
						},
					},
				},
			},

			{
				widget = wibox.container.margin,
				margins = 10,
				{
					forced_height = 100,
					forced_width = 20,
					direction = "east",
					layout = wibox.container.rotate,
					{
						widget = require("ui.widgets.volume").bar,
					},
				},
			},
		},

		require("ui.widgets.taglist"),
		require("ui.widgets.playerctl").setup(),
		require("ui.widgets.backup").setup(),
		require("ui.widgets.rotating-progress"),
	},

	border_color = "#fabd2f",
	border_width = 2,
	ontop = true,
	input_passthrough = true,
	placement = awful.placement.centered,
	type = "notification",
	shape = gears.shape.rectangle,
	visible = false,
})

local _M = {}

function _M.show()
	Dashboard.screen = awful.screen.focused()
	Dashboard.visible = not Dashboard.visible
end
return _M
