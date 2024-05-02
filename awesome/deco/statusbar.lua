local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")

local deco = {
  taglist = require("deco.taglist"),
  -- tasklist = require("deco.tasklist"),
}

local _M = {}

local taglist_buttons = deco.taglist()
local text_clock = wibox.widget.textclock()

-- local sys = wibox.widget({
--   {
--     {
--       {
--         sys.net,
--         sys.blu,
--         sys.vol,
--         spacing = dpi(20),
--         layout = wibox.layout.fixed.vertical,
--       },
--       oth.sep,
--       sys.clock,
--       layout = wibox.layout.fixed.vertical,
--     },
--     left = dpi(2),
--     right = dpi(2),
--     bottom = dpi(10),
--     top = dpi(10),
--     widget = wibox.container.margin,
--   },
--   shape = help.rect(beautiful.br),
--   bg = beautiful.bg2,
--   widget = wibox.container.background,
-- })

awful.screen.connect_for_each_screen(function(s)
  -- General process
  --> Wallpaper
  --> Create a promptbox for each screen
  --> Create an imagebox widget
  --> Create a taglist widget
  --> Create a tasklist widget
  --> Create the wibox
  --> Add widgets to the wibox

  -- TODO: https://awesomewm.org/doc/api/classes/awful.widget.taglist.html
  s.taglist = awful.widget.taglist({
    screen = s,
    -- filter = awful.widget.taglist.filter.all,
    filter = awful.widget.taglist.filter.noempty,
    buttons = taglist_buttons,
  })

  s.text_clock = text_clock

  s.layoutbox = awful.widget.layoutbox(s)
  s.layoutbox:buttons(gears.table.join(
    awful.button({}, 1, function()
      awful.layout.inc(1)
    end),
    awful.button({}, 3, function()
      awful.layout.inc(-1)
    end)
  ))

  s.wibox = awful.wibar({ position = "top", screen = s })

  -- Add widgets to the wibox
  local layout = wibox.layout.align.horizontal()
  layout.mode = "outside"

  s.wibox:setup({
    layout = layout,
    expand = "none",
    { -- Left widgets
      layout = wibox.layout.fixed.horizontal,
      s.taglist,
      -- s.mypromptbox,
    },
    s.text_clock,
    { -- Right widgets
      layout = wibox.layout.fixed.horizontal,
      wibox.widget.systray(),
      s.layoutbox,
    },
  })

  -- vertical bar
  -- awful
  --     .wibar({
  --       position = "left",
  --       bg = beautiful.bg,
  --       fg = beautiful.pri,
  --       width = dpi(50),
  --       screen = s,
  --     })
  --     :setup({
  --       layout = wibox.layout.align.vertical,
  --
  --       {},
  --
  --       {
  --         left = dpi(5),
  --         right = dpi(5),
  --         top = dpi(10),
  --         bottom = dpi(5),
  --
  --         layout = wibox.layout.flex.vertical,
  --
  --         wibox.widget({
  --           font = beautiful.barfont,
  --           format = "%I\n%M",
  --           refresh = 1,
  --           align = "center",
  --           valign = "center",
  --           widget = wibox.widget.textclock,
  --         }),
  --       },
  --
  --       {},
      -- })
end)
