#!/bin/sh

source /etc/X11/xinit/xinitrc.d/50-systemd-user.sh

exec awesome

[ -z '$DBUS_SESSION_BUS_ADDRESS' ] && eval $(/usr/bin/dbus-launch --exit-with-session --sh-syntax) dbus-update-activation-environment --verbose --all

