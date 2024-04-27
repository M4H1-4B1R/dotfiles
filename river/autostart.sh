#!/usr/bin/env sh
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
~/.azotebg &
#waybar &
dunst &
wl-clipboard-history -t &
nm-applet --indicator &
"dbus-update-activation-environment --systemd DBUS_SESSION_BUS_ADDRESS SEATD_SOCK DISPLAY WAYLAND_DISPLAY XAUTHORITY XDG_CURRENT_DESKTOP=river"

