#!/bin/sh

pkill aw-
nohup /usr/bin/aw-server >/dev/null 2>&1 &
sleep 10
exec /usr/bin/aw-watcher-window-wayland
notify-send "start aw-wayland success"
