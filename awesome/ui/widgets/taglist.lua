local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")

local function my_tag_shape(cr, width, height)
	gears.shape.rounded_rect(cr, width, height, 5) -- Example for rounded rectangle
end

return awful.widget.taglist({
	screen = s,
	filter = awful.widget.taglist.filter.all,
	buttons = taglist_buttons,
	layout = {
		spacing = 5,
		layout = wibox.layout.fixed.horizontal,
	},
	widget_template = {
		{
			{
				{
					id = "text_role",
					widget = wibox.widget.textbox,
				},
				left = 10,
				right = 10,
				widget = wibox.container.margin,
			},
			id = "background_role",
			widget = wibox.container.background,
			shape = my_tag_shape, -- Apply the shape here
		},
		margins = 2,
		widget = wibox.container.margin,
	},
})
