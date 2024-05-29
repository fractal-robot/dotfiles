local lain = require("lain")

return lain.widget.alsabar({
	-- settings = function()
	-- 	widget:set_markup(volume_now.level .. "% ")
	-- end,
	colors = {
		background = "#282828",
		unmute = "#b8bb26",
		mute = "#fb4934",
	},
})
