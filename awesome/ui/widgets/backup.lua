local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local dpi = require("beautiful.xresources").apply_dpi

local _M = {}

function _M.setup()
	local color = "#ea6962"

	local border = wibox.widget({
		widget = wibox.container.margin,
		margins = dpi(1),
		color = "",
	})

	local watcher = awful.widget.watch("cat /tmp/backup.status", 10, function(widget, stdout)
		if stdout == nil then
			return
		end

		stdout = stdout:match("^%s*(.-)%s*$")

		if stdout == "DONE" then
			color = "#a9b665"
		elseif stdout == "PENDING" then
			color = "#d8a657"
		else
			color = "#ea6962"
		end

		widget:set_markup("Backup: <span foreground='" .. color .. "' weight='bold'>" .. stdout .. "</span>")
		border.color = color
	end)

	return wibox.widget({
		widget = wibox.container.margin,
		-- right = dpi(2),
		-- left = dpi(2),
		margins = dpi(2),
		{
			widget = wibox.container.background,
			bg = beautiful.bar_bg_alt,
			{
				widget = border,
				{
					widget = wibox.container.margin,
					left = dpi(8),
					right = dpi(8),
					{
						widget = watcher,
					},
				},
			},
		},
	})
end

return _M
