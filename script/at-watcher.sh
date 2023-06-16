#!/bin/sh

echo "start aw-server"
nohup /usr/bin/aw-server &
sleep 10
echo "start server success"
exec /usr/bin/aw-watcher-window-wayland
echo "start aw success"
