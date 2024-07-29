local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local dpi = require("beautiful.xresources").apply_dpi
local gears = require("gears")

local lain = require("lain")
local markup = lain.util.markup

local _M = {}

_M.popup = awful.popup({
    widget = {
        {
            text   = "Hello, world!",
            widget = wibox.widget.textbox
        },
        margins = 10,
        widget  = wibox.container.margin
    },
    border_color = '#00ff00',
    border_width = 2,
    placement    = awful.placement.centered,
    shape        = gears.shape.rounded_rect,
    visible      = true,
}
})

function _M.show()
	_M.popup.visible = true
end

function _M.hide()
	_M.popup.visible = false
end

return _M
