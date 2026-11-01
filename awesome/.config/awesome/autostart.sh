#!/bin/sh
xset r rate 200 50 &
picom &
# /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 & 
lxpolkit &
feh --bg-fill --randomize /home/abir/walls/ &
cbatticon &
nm-applet &
volumeicon &
blueman-applet &
dunst &
xclip &
ibus-daemon -dr &
