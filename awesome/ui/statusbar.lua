local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local dpi = require("beautiful.xresources").apply_dpi

local gears = require("gears")

-- local Day_info = require("ui.day-info")

awful.screen.connect_for_each_screen(function(s)
	s.textclock = wibox.widget.textclock()

	s.taglist = awful.widget.taglist({
		screen = s,
		filter = awful.widget.taglist.filter.all,
		-- filter = awful.widget.taglist.filter.noempty,
	})

	s.layoutbox = awful.widget.layoutbox(s)
	s.layoutbox:buttons(gears.table.join(
		awful.button({}, 1, function()
			awful.layout.inc(1)
		end),
		awful.button({}, 3, function()
			awful.layout.inc(-1)
		end)
	))

	s.wibox = awful.wibar({
		position = "bottom",
		screen = s,
		-- forced_height = dpi(80) + beautiful.border_width,
		-- height = dpi(34),
		height = dpi(38),
		bg = beautiful.bar_bg,
	})

	s.wibox:setup({
		expand = "none",
		layout = wibox.layout.align.horizontal(),

		{
			widget = wibox.container.margin,
			margins = 4,
			{
				layout = wibox.layout.align.horizontal,

				{ -- Left widgets
					layout = wibox.layout.fixed.horizontal,
					s.taglist,
					-- s.mypromptbox,
				},

				{ -- center widgets
					layout = wibox.layout.fixed.horizontal,
					require("ui.widgets.clock"),
					require("ui.widgets.playerctl").setup(),
					require("ui.widgets.backup").setup(),
				},

				{ -- Right widgets
					layout = wibox.layout.fixed.horizontal,
					wibox.widget.systray(),
					s.layoutbox,
					require("ui.widgets.volume").bar,
				},
			},
		},
	})
end)