#!/usr/bin/env sh

[ -z "$DBUS_SESSION_BUS_ADDRESS" ] && eval $(/usr/bin/dbus-launch --exit-with-session --sh-syntax)
dbus-update-activation-environment --verbose --all

/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
feh --bg-fill --randomize ~/walls &
picom --config ~/.config/picom/picom.conf &
dunst &
xclip &
volumeicon &
nm-applet &
blueman-applet &
dwmblocks &

