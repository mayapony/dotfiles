#!/bin/sh

echo "start aw-server"
nohup /usr/bin/aw-server >/dev/null 2>&1 &
sleep 10
echo "start server success"
exec /usr/bin/aw-watcher-window-wayland
echo "start aw success"
