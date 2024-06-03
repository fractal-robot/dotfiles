local wibox = require("wibox")
local beautiful = require("beautiful")
local awful = require("awful")
local lain = require("lain")
local gears = require("gears")
local markup = lain.util.markup
local dpi = require("beautiful.xresources").apply_dpi

local terminal = RC.vars.terminal
local editor = RC.vars.editor
local editor_cmd = RC.vars.editor_cmd

local myawesomemenu = {
	{
		"hotkeys",
		function()
			hotkeys_popup.show_help(nil, awful.screen.focused())
		end,
	},
	{ "manual", terminal .. " -e man awesome" },
	{ "edit config", editor_cmd .. " " .. awesome.conffile },
	{ "restart", awesome.restart },
	{
		"quit",
		function()
			awesome.quit()
		end,
	},
}

local mymainmenu = awful.menu({
	items = {
		{ "awesome", myawesomemenu, beautiful.awesome_icon },
		{ "open terminal", terminal },
	},
})

local button = wibox.widget({
	widget = wibox.container.margin,
	left = dpi(0),
	right = dpi(0),

	forced_height = dpi(20),
	forced_width = dpi(40),
	{
		widget = wibox.container.background,
		bg = beautiful.red_light,
		fg = beautiful.bg_normal,
		{

			widget = wibox.container.margin,
			-- left = dpi(6),
			-- right = dpi(6),
			left = dpi(0),
			right = dpi(0),

			{
				widget = wibox.widget.textbox,
				markup = markup.font("Symbols Nerd Font 16", "󰣇"),
				align = "center",
				valign = "center",
			},
		},
	},
})

local function set_properties(c)
	-- Set the properties
	c.left = dpi(3)
	c.right = dpi(-3)
	c.top = dpi(3)
	c.bottom = dpi(-3)

	gears.timer.start_new(0.1, function()
		c.left = dpi(0)
		c.right = dpi(0)
		c.top = dpi(0)
		c.bottom = dpi(0)
	end)
end

button:connect_signal("button::press", function(c)
	require("main.menu"):toggle()
	set_properties(c)
end)

return button
