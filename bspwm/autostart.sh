#!/usr/bin/env sh
~/.config/bspwm/launch.sh
#/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
/usr/libexec/polkit-gnome-authentication-agent-1 &
#nitrogen --restore &
feh --bg-fill --randomize ~/walls/ &
picom --config ~/.config/picom/picom.conf &
# compfy &
dunst &
xclip &
volumeicon &
nm-applet &
numlockx on &
#xfce4-power-manager &
sxhkd -c ~/.config/bspwm/sxhkdrc &
xinput set-prop "SynPS/2 Synaptics TouchPad" "libinput Tapping Enabled" 1
