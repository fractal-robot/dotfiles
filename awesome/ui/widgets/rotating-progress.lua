-- Import necessary libraries
local gears = require("gears")
local wibox = require("wibox")

-- Define the rotating characters
-- local chars = { "◢", "◣", "◤", "◥" } -- Characters of the same length
-- local chars = { "○", "◔", "◑", "◕" }
-- local chars = { "-", "/", "|", "\\" } -- Characters of the same length
local chars = { "⌞", "⌜", "⌝", "⌟" }

-- Define font settings
local font_name = "Roboto" -- Change to your preferred font
local font_size = 24 -- Change to your preferred font size

-- Initialize the index and create the widget
local index = 1
local rotating_widget = wibox.widget({
	font = font_name .. " " .. font_size,
	align = "center",
	valign = "center",
	widget = wibox.widget.textbox(chars[index]),
})

-- Function to update the widget
local function update_widget()
	index = index % #chars + 1
	rotating_widget:set_text(chars[index])
end

-- Set up a timer to call the update function periodically
local timer = gears.timer({ timeout = 0.7 })
timer:connect_signal("timeout", update_widget)
timer:start()

return rotating_widget
