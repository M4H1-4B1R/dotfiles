#!/bin/bash

##
## By default, Sway sets HiDPI displays to 2.0 scaling. Testing revealed this
## can lead to a bad experience in the live environment on some displays. This
## script checks if the scaling has been set to 2.0, and sets it to 1.5 instead.
##
## After configuring your outputs according to your preference in
## ~/.config/sway/config.d/output, this script can be deleted.
##

# Iterate over each output and check for 2.0 scaling
swaymsg -t get_outputs | jq -r '.[] | select(.scale == 2.0) | .name' | while read -r output; do
	# Set scale factor to 1.5 for HiDPI displays
	swaymsg output "$output" scale 1.5
done
