#!/bin/bash
# kitty +kitten themes --reload-in all --config-file-name kitty.conf Rosé Pine Moon;
kitty +kitten themes --reload-in all --config-file-name kitty.conf Everforest Dark Medium;

tmux set -g "window-style" "bg=default";
tmux set -g "window-active-style" "bg=default";

darkman set dark;

# sed -i 's/Theme=\(.*\)/Theme=rose-pine-moon/' ~/.config/fcitx5/conf/classicui.conf

echo "night";
