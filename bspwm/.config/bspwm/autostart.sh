#!/usr/bin/env sh
~/.config/bspwm/launch.sh
/usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1 &
# /usr/libexec/polkit-gnome-authentication-agent-1 &
#nitrogen --restore &
feh --bg-fill --randomize ~/walls &
picom --config ~/.config/picom/picom.conf &
# compfy &
dunst &
xclip &
volumeicon &
nm-applet &
blueman-applet &
#xfce4-power-manager &
sxhkd -c ~/.config/bspwm/sxhkdrc &
