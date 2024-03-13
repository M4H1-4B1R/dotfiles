#!/bin/bash

/usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1 &
nitrogen --random ~/walls/ --set-zoom-fill &
picom --config ~/.config/picom/picom.conf --experimental-backends &
numlockx on &
dunst &
nm-applet &
blueman-applet &
volumeicon &
xfce4-power-manager &
xinput set-prop "SynPS/2 Synaptics TouchPad" "libinput Tapping Enabled" 1
