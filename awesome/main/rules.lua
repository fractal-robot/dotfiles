-- Standard awesome library
local awful = require("awful")
-- Theme handling library
local beautiful = require("beautiful")

local _M = {}

function _M.get(clientkeys, clientbuttons)
	local rules = {

		-- All clients will match this rule.
		{
			rule = {},
			properties = {
				border_width = beautiful.border_width,
				border_color = beautiful.border_normal,
				focus = awful.client.focus.filter,
				raise = true,
				keys = clientkeys,
				buttons = clientbuttons,
				screen = awful.screen.preferred,
				placement = awful.placement.no_overlap + awful.placement.no_offscreen,
			},
		},

		-- Floating clients.
		{
			rule_any = {
				instance = {
					"DTA", -- Firefox addon DownThemAll.
					"copyq", -- Includes session name in class.
					"pinentry",
				},
				class = {
					"Arandr",
					"Blueman-manager",
					"Gpick",
					"Kruler",
					"MessageWin", -- kalarm.
					"Sxiv",
					-- "Tor Browser", -- Needs a fixed window size to avoid fingerprinting by screen size.
					"Wpa_gui",
					"veromix",
					"xtightvncviewer",
				},

				-- Note that the name property shown in xprop might be set slightly after creation of the client
				-- and the name shown there might not match defined rules here.
				name = {
					"Event Tester", -- xev.
				},
				role = {
					"AlarmWindow", -- Thunderbird's calendar.
					"ConfigManager", -- Thunderbird's about:config.
					"pop-up", -- e.g. Google Chrome's (detached) Developer Tools.
				},
			},
			properties = {
				floating = true,
			},
		},

		{
			rule = { class = "GLava" },
			properties = {
				sticky = true,
				focusable = false,
				border_width = 0,
				below = true,
				ontop = false,
				maximized_horizontal = true,
				maximized_vertical = true,
			},
			callback = function(c)
				c:lower() -- Ensure the window is below other windows
			end,
		},

		{ rule = { class = "obsidian" }, properties = { tag = "󰎚" } },
	}

	return rules
end

return setmetatable({}, {
	__call = function(_, ...)
		return _M.get(...)
	end,
})
