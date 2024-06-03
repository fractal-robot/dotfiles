local gears = require("gears")
local awful = require("awful")
local beautiful = require("beautiful")
local wibox = require("wibox")
local naughty = require("naughty")

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
			-- id = "background_role",
			widget = wibox.container.background,
			bg = "#555555",
			-- create_callback = function(self, c, index, objects)
			create_callback = function(_, _, _, _)
				local function print_client_tags()
					local focused_client = client.focus
					if focused_client then
						local tags = focused_client:tags()
						local tags_str = "Tags for focused client:\n"
						for _, t in ipairs(tags) do
							tags_str = tags_str .. t.name .. "\n"
						end
						naughty.notify({ title = "Client Tags", text = tags_str, timeout = 5 })
					else
						naughty.notify({ title = "No focused client", text = "", timeout = 5 })
					end
				end

				client.connect_signal("focus", print_client_tags)
				client.connect_signal("tagged", print_client_tags)
				client.connect_signal("untagged", print_client_tags)
			end,
		},
	})
end)
