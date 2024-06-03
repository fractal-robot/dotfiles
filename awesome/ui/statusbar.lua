local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local dpi = require("beautiful.xresources").apply_dpi
local gears = require("gears")

local lain = require("lain")
local markup = lain.util.markup

require("ui.widgets.mytaglist")

-- separator
local separator = wibox.widget({
	widget = wibox.widget.textbox,
	markup = "  ",
})

awful.screen.connect_for_each_screen(function(s)
	s.taglist = awful.widget.taglist({
		screen = s,
		filter = awful.widget.taglist.filter.all,

		widget_template = {
			widget = wibox.container.background,
			id = "background_role",

			{
				left = 10,
				right = 10,
				widget = wibox.container.margin,

				{
					layout = wibox.layout.fixed.horizontal,

					{
						id = "text_role",
						widget = wibox.widget.textbox,
					},
				},
			},

			-- create_callback = function(self, c3, index, objects) --luacheck: no unused args
			-- 	self:get_children_by_id("index_role")[1].markup = "<b> " .. index .. " </b>"
			-- 	self:connect_signal("mouse::enter", function()
			-- 		if self.bg ~= "#ff0000" then
			-- 			self.backup = self.bg
			-- 			self.has_backup = true
			-- 		end
			-- 		self.bg = "#ff0000"
			-- 	end)
			-- 	self:connect_signal("mouse::leave", function()
			-- 		if self.has_backup then
			-- 			self.bg = self.backup
			-- 		end
			-- 	end)
			-- end,
			-- update_callback = function(self, c3, index, objects) --luacheck: no unused args
			-- 	self:get_children_by_id("index_role")[1].markup = "<b> " .. index .. " </b>"
			-- end,
		},
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
		-- height = dpi(38),
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
					separator,
					s.taglist,
					separator,
					s.mytaglist,
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
