#!/bin/bash

/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
# nitrogen --random ~/walls/ --set-zoom-fill &
nitrogen --restore &
picom --config ~/.config/picom/picom.conf &
numlockx on &
dunst &
nm-applet &
blueman-applet &
volumeicon &
xfce4-power-manager &
autotiling &
xinput set-prop "SynPS/2 Synaptics TouchPad" "libinput Tapping Enabled" 1
