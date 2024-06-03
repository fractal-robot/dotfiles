local gears = require("gears")
local awful = require("awful")
local beautiful = require("beautiful")
local wibox = require("wibox")

-- Custom function to update tag colors based on focused client
local function update_tag_colors()
	-- Get the focused client
	local focused_client = client.focus

	-- Iterate over all screens and their tags
	for s in screen do
		for _, t in ipairs(s.tags) do
			if focused_client and focused_client:isvisible(t) and not focused_client:isvisible(s.selected_tag) then
				-- Change the foreground color of the tag if the focused client is also on this tag but not the current one
				t.fg_color = beautiful.taglist_fg_focus_toggled or "#ff0000"
			else
				-- Reset to the default foreground color
				t.fg_color = beautiful.taglist_fg_focus or "#ffffff"
			end
		end
	end

	-- Redraw the taglist
	for s in screen do
		if s.mytaglist then
			s.mytaglist:emit_signal("widget::redraw_needed")
		end
	end
end

-- Connect the function to client focus and tag signals
client.connect_signal("focus", update_tag_colors)
client.connect_signal("unfocus", update_tag_colors)
client.connect_signal("tagged", update_tag_colors)
client.connect_signal("untagged", update_tag_colors)
tag.connect_signal("property::selected", update_tag_colors)

-- Call the function initially to set the correct colors
update_tag_colors()

-- Define your taglist widget respecting the fg_color property

awful.screen.connect_for_each_screen(function(s)
	-- Each screen has its own taglist
	s.mytaglist = awful.widget.taglist({
		screen = s,
		filter = awful.widget.taglist.filter.all,
		widget_template = {
			{
				{
					{
						id = "text_role",
						widget = wibox.widget.textbox,
					},
					layout = wibox.layout.fixed.horizontal,
				},
				left = 4,
				right = 4,
				widget = wibox.container.margin,
			},
			id = "background_role",
			widget = wibox.container.background,
			create_callback = function(self, c, index, objects)
				self:connect_signal("mouse::enter", function()
					-- change background color on mouse enter
					self:set_bg("#ffffff")
				end)
				self:connect_signal("mouse::leave", function()
					-- change background color back on mouse leave
					self:set_bg("#000000")
				end)
			end,
		},
	})
end)
