local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local dpi = require("beautiful.xresources").apply_dpi
local gears = require("gears")

local lain = require("lain")
local markup = lain.util.markup

require("ui.widgets.taglist")

-- separator
local separator = wibox.widget({
	widget = wibox.widget.textbox,
	markup = "  ",
})

awful.screen.connect_for_each_screen(function(s)
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
					-- s.taglist,
					-- s.mypromptbox,
				},

				{ -- center widgets
					layout = wibox.layout.fixed.horizontal,
					require("ui.widgets.menu"),
					separator,
					require("ui.widgets.cpu"),
					separator,
					require("ui.widgets.mem"),
					separator,
					require("ui.widgets.backup"),
					separator,
					separator,
					require("ui.widgets.calendar"),
					separator,
					require("ui.widgets.clock"),
					separator,
					require("ui.widgets.volume").widget,
					separator,
					s.taglist,
					separator,
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
