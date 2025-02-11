#!/bin/bash

/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
nitrogen --restore &
# feh --bg-fill --randomize ~/walls &
picom --config ~/.config/picom/picom.conf &
numlockx on &
dunst &
xclip &
nm-applet &
blueman-applet &
volumeicon &
xfce4-power-manager &
autotiling &
xinput set-prop "SynPS/2 Synaptics TouchPad" "libinput Tapping Enabled" 1
