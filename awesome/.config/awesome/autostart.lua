pcall(require, "luarocks.loader")

-- Standard awesome library
local awful = require("awful")

--autostart
awful.spawn.with_shell("picom")
awful.spawn.with_shell("/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1")
awful.spawn.with_shell("feh --bg-fill --randomize /home/abir/walls/")
awful.spawn.with_shell("cbatticon")
awful.spawn.with_shell("dunst")
awful.spawn.with_shell("xclip")

awful.spawn.with_shell(
	"[ -z '$DBUS_SESSION_BUS_ADDRESS' ] && eval $(/usr/bin/dbus-launch --exit-with-session --sh-syntax) dbus-update-activation-environment --verbose --all"
)
