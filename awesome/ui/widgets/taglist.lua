local awful = require("awful")
local beautiful = require("beautiful")
local wibox = require("wibox")

awful.screen.connect_for_each_screen(function(s)
	s.taglist = awful.widget.taglist({
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
			widget = wibox.container.background,
			id = "background_role",

			create_callback = function(self, t, _, _)
				local function update_client_tags()
					local client = client.focus
					local tags = {}
					if client then
						tags = client:tags()
					else
						self.fg = beautiful.fg_normal
					end

					for _, tag in pairs(tags) do
						if t == awful.tag.focused then
							return
						end

						if t == tag then
							self.fg = beautiful.taglist_fg_toggled

							break
						else
							self.fg = beautiful.fg_normal
						end
					end
				end

				client.connect_signal("focus", update_client_tags)
				client.connect_signal("unfocus", update_client_tags)
				client.connect_signal("tagged", update_client_tags)
				client.connect_signal("untagged", update_client_tags)

				update_client_tags()
			end,
		},
	})
end)
