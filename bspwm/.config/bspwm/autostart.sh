#!/usr/bin/env sh
~/.config/bspwm/launch.sh
/usr/libexec/polkit-gnome-authentication-agent-1 &
feh --bg-fill --randomize ~/walls &
picom --config ~/.config/picom/picom.conf &
dunst &
xclip &
volumeicon &
nm-applet &
blueman-applet &
#xfce4-power-manager &
sxhkd -c ~/.config/bspwm/sxhkdrc &
brightnessctl set 40%
