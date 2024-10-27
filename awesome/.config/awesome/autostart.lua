pcall(require, "luarocks.loader")

-- Standard awesome library
local awful = require("awful")

--autostart
awful.spawn.with_shell("picom")
awful.spawn.with_shell("/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1")
awful.spawn.with_shell("feh --bg-fill /home/abir/walls/yellow-car.jpg")
awful.spawn.with_shell("cbatticon")
awful.spawn.with_shell("nm-applet")
awful.spawn.with_shell("dunst")
awful.spawn.with_shell("xclip")
awful.spawn.with_shell("xfce4-power-manager")
