#!/bin/bash

# Check what workspace we are on
current_workspace=$(swaymsg -t get_workspaces | jq '.[] | select(.focused == true).num')

# Check the total number of workspaces
total_workspaces=$(swaymsg -t get_workspaces | jq 'length')

# Check if the current workspace is greater than or equal to the total number of workspaces
if [ "$current_workspace" -ge "$total_workspaces" ]; then
    # If it is, create a new workspace at current_workspace + 1
    swaymsg workspace number "$((current_workspace + 1))"
else
    # If it's not, simply switch to the next workspace
    swaymsg workspace next
fi
