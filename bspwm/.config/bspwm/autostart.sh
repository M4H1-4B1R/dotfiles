#!/usr/bin/env sh
~/.config/bspwm/launch.sh
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
feh --bg-fill ~/walls/pink-waves.jpg &
picom --config ~/.config/picom/picom.conf &
dunst &
xclip &
volumeicon &
nm-applet &
blueman-applet &
xfce4-power-manager &
sxhkd -c ~/.config/bspwm/sxhkdrc &
