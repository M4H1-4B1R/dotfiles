#!/usr/bin/env sh
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
#/usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1 &
nitrogen --restore &
picom --config ~/.config/picom/picom.conf &
dunst &
xclip &
volumeicon &
nm-applet &
numlockx on &
xinput set-prop "SynPS/2 Synaptics TouchPad" "libinput Tapping Enabled" 1
