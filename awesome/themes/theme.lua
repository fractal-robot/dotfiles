---------------------------
-- Default awesome theme --
---------------------------

local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
local gears = require("gears")

local gfs = require("gears.filesystem")
local themes_path = gfs.get_themes_dir()
local cus

local custom_theme_path = gfs.get_configuration_dir()

local theme = {}

theme.font = "Roboto 12"
theme.barfont = font

theme.bg_normal = "#282828"
theme.bg_systray = theme.bg_normal
theme.bg_focus = "#32302f"
theme.bg_urgent = "#ea6962"

theme.bg_alt = "#32302f"
-- theme.bg_minimize   = "#444444"

theme.red = "#cc241d"
theme.red_light = "#fb4934"
theme.green = "#98971a"
theme.green_light = "#b8bb26"
theme.yellow = "#d79921"
theme.yellow_light = "#fabd2d"
theme.blue = "#458588"
theme.blue_light = "#83a598"
theme.purple = "#b16286"
theme.purple_light = "#d3869b"
theme.aqua = "#689d6a"
theme.aqua_light = "#8ec07c"
theme.orange = "#d65d0e"
theme.orange_light = "#fe8019"

theme.sep_width = dpi(2)
theme.border_width = dpi(2)

theme.fg_normal = "#d4be98"

theme.useless_gap = dpi(0)
theme.border_width = dpi(2.5)
theme.border_normal = theme.bg_normal
theme.border_focus = "#928374"
theme.border_marked = "#ea6962"

-- bar
theme.bar_bg = theme.bg_normal
theme.bar_bg_alt = theme.bg_alt

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- taglist_[bg|fg]_[focus|urgent|occupied|empty|volatile]
-- tasklist_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- mouse_finder_[color|timeout|animate_timeout|radius|factor]
-- prompt_[fg|bg|fg_cursor|bg_cursor|font]
-- hotkeys_[bg|fg|border_width|border_color|shape|opacity|modifiers_fg|label_bg|label_fg|group_margin|font|description_font]
-- Example:
--theme.taglist_bg_focus = "#ff0000"

-- taglist
theme.taglist_font = "Symbols Nerd Font 16"

theme.taglist_fg_focus = theme.bg_normal
theme.taglist_bg_focus = theme.green

theme.taglist_fg_toggled = theme.yellow

theme.taglist_fg_urgent = theme.red_light
theme.taglist_bg_urgent = theme.bg_normal

theme.notification_bg = theme.bg_urgent
theme.notification_fg = theme.fg
-- theme.notification_width = dpi(225)
-- theme.notification_max_height = dpi(80)
-- theme.notification_icon_size = dpi(80)

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon = themes_path .. "default/submenu.png"
theme.menu_height = dpi(23)
theme.menu_width = dpi(200)
theme.menu_fg_focus = theme.bg_normal
theme.menu_bg_focus = theme.fg_normal

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = "#cc0000"

-- Define the image to load
theme.titlebar_close_button_normal = themes_path .. "default/titlebar/close_normal.png"
theme.titlebar_close_button_focus = themes_path .. "default/titlebar/close_focus.png"

theme.titlebar_minimize_button_normal = themes_path .. "default/titlebar/minimize_normal.png"
theme.titlebar_minimize_button_focus = themes_path .. "default/titlebar/minimize_focus.png"

theme.titlebar_ontop_button_normal_inactive = themes_path .. "default/titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive = themes_path .. "default/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active = themes_path .. "default/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active = themes_path .. "default/titlebar/ontop_focus_active.png"

theme.titlebar_sticky_button_normal_inactive = themes_path .. "default/titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive = themes_path .. "default/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active = themes_path .. "default/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active = themes_path .. "default/titlebar/sticky_focus_active.png"

theme.titlebar_floating_button_normal_inactive = themes_path .. "default/titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive = themes_path .. "default/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active = themes_path .. "default/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active = themes_path .. "default/titlebar/floating_focus_active.png"

theme.titlebar_maximized_button_normal_inactive = themes_path .. "default/titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive = themes_path .. "default/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active = themes_path .. "default/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active = themes_path .. "default/titlebar/maximized_focus_active.png"

-- You can use your own layout icons like this:
theme.layout_fairh = themes_path .. "default/layouts/fairhw.png"
theme.layout_fairv = themes_path .. "default/layouts/fairvw.png"
theme.layout_floating = themes_path .. "default/layouts/floatingw.png"
theme.layout_magnifier = themes_path .. "default/layouts/magnifierw.png"
theme.layout_max = themes_path .. "default/layouts/maxw.png"
theme.layout_fullscreen = themes_path .. "default/layouts/fullscreenw.png"
theme.layout_tilebottom = themes_path .. "default/layouts/tilebottomw.png"
theme.layout_tileleft = themes_path .. "default/layouts/tileleftw.png"
theme.layout_tile = themes_path .. "default/layouts/tilew.png"
theme.layout_tiletop = themes_path .. "default/layouts/tiletopw.png"
theme.layout_spiral = themes_path .. "default/layouts/spiralw.png"
theme.layout_dwindle = themes_path .. "default/layouts/dwindlew.png"
theme.layout_cornernw = themes_path .. "default/layouts/cornernww.png"
theme.layout_cornerne = themes_path .. "default/layouts/cornernew.png"
theme.layout_cornersw = themes_path .. "default/layouts/cornersww.png"
theme.layout_cornerse = themes_path .. "default/layouts/cornersew.png"

-- theme.taglist_shape_focus = gears.shape.hexagon
-- theme.wallpaper = nil
-- theme.wallpaper = nil
-- theme.wallpaper_bg = "#282828"

-- Generate Awesome icon:
theme.awesome_icon = theme_assets.awesome_icon(theme.menu_height, theme.fg_normal, theme.bg_normal)
-- theme.awesome_icon = custom_theme_path .. "themes/archlinux-512.png"

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.

theme.gap_single_client = false

theme.icon_theme = nil

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
--
