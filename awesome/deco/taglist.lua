local gears = require("gears")
local awful = require("awful")

local _M = {}
local modkey = RC.vars.modkey

function _M.get(_)
  local taglilst_buttons = gears.table.join(
    awful.button({}, 1, function(t)
      t:view_only()
    end),

    awful.button({ modkey }, 1, function(t)
      if client.focus then
        client.focus:move_to_tag(t)
      end
    end),

    awful.button({}, 3, awful.tag.viewtoggle)
  )

  return taglilst_buttons
end

return setmetatable({}, {
  __call = function(_, ...)
    return _M.get(...)
  end,
})
