local wibox = require("wibox")
local beautiful = require("beautiful")
local lain = require("lain")
local markup = lain.util.markup
local dpi = require("beautiful.xresources").apply_dpi

local icon = "󰕾"

local _M = {}

local status = wibox.widget({
	widget = wibox.widget.textbox,
	markup = markup.fontfg("Symbols Nerd Font 12", beautiful.bg_normal, icon),
})

local volume = lain.widget.alsa({
	settings = function()
		icon = volume_now.status == "on" and "󰕾" or "󰖁"
		status.markup = markup.fontfg("Symbols Nerd Font 14", beautiful.bg_normal, icon)

		widget:set_markup(markup.fg.color(beautiful.bg_normal, volume_now.level))
	end,
})

_M.widget = wibox.widget({
	layout = wibox.layout.align.horizontal,

	{
		widget = wibox.container.background,
		bg = beautiful.purple_light,

		{
			widget = wibox.container.margin,
			left = dpi(6),
			right = dpi(6),

			status,
		},
	},

	{
		widget = wibox.container.background,
		bg = beautiful.purple,

		{
			widget = wibox.container.margin,
			left = dpi(6),
			right = dpi(6),

			volume,
		},
	},
})

function _M.update()
	volume.update()
end

return _M
