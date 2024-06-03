#!/bin/sh
swaybg -i $(find $HOME/walls/./. -type f | shuf -n1) -m fill &
