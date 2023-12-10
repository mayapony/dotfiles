#!/bin/bash

pkill aw-
sleep 10
notify-send "kill aw-x11 over"   # Optional, sends a notification when ActivityWatch is started
cd ~/.local/opt/activitywatch         # Put your ActivityWatch install folder here


./aw-watcher-afk/aw-watcher-afk &
./aw-watcher-window/aw-watcher-window &                 # you can add --exclude-title here to exclude window title tracking for this session only
notify-send "aw-x11 started"   # Optional, sends a notification when ActivityWatch is started
./aw-server/aw-server;
