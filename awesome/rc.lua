-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
-- Widget and layout library
local wibox = require("wibox")
-- Theme handling library
local beautiful = require("beautiful")
-- Notification library
local naughty = require("naughty")
-- local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")
local bling = require("bling")

--------------------------------------------------------------------------------
--- config ---------------------------------------------------------------------
--------------------------------------------------------------------------------

dpi = require("beautiful.xresources").apply_dpi

require("main.error-handling")
require("main.signals")

require("awful.hotkeys_popup.keys")

beautiful.init(gears.filesystem.get_configuration_dir() .. "themes/rose-pine-custom/theme.lua")

local main = {
  layouts = require("main.layouts"),
  rules = require("main.rules"),
  tags = require("main.tags"),
  -- menu = require("main.menu"),
}

RC = {} -- global namespace
RC.layouts = main.layouts()
RC.tags = main.tags()
RC.vars = require("main.user-variables")

--------------------------------------------------------------------------------
--- bindings -------------------------------------------------------------------
--------------------------------------------------------------------------------

local binding = {
  globalbuttons = require("binding.globalbuttons"),
  clientbuttons = require("binding.clientbuttons"),
  globalkeys = require("binding.globalkeys"),
  bindtotags = require("binding.bindtotags"),
  clientkeys = require("binding.clientkeys"),
}

RC.globalkeys = binding.globalkeys()
RC.globalkeys = binding.bindtotags(RC.globalkeys)

root.buttons(binding.globalbuttons())
root.keys(RC.globalkeys)

awful.rules.rules = main.rules(binding.clientkeys(), binding.clientbuttons())

--------------------------------------------------------------------------------
--- theme ----------------------------------------------------------------------
--------------------------------------------------------------------------------

require("deco.statusbar")
