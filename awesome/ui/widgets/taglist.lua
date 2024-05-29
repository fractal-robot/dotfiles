local awful = require("awful")
local dpi = require("beautiful.xresources").apply_dpi

return awful.widget.taglist({
	screen = awful.screen.focused(),
	filter = awful.widget.taglist.filter.all,
	style = {
		font = "Roboto Bold 16",

		fg_focus = "#282828",
		bg_focus = "#b8bb26",

		fg_urgent = "#282828",
		bg_urgent = "#fb4934",

		fg_occupied = "#b8bb26",
		bg_occupied = "#282828",

		bg_empty = "#282828",
		fg_empty = "#ebdbb2",

		spacing = dpi(4),

		-- bg_volatile = "# ",
		-- fg_volatile = "# ",
	},
})
