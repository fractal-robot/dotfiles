local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup")

return awful.menu({
	items = {
		{ "Restart awesome", awesome.restart },
		{
			"Quit awesome",
			function()
				endawesome.quit()
			end,
		},
		{
			"Show help",
			function()
				hotkeys_popup.show_help()
			end,
		},
	},
})
