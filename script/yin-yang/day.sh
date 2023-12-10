#!/bin/bash
# kitty +kitten themes --reload-in all --config-file-name kitty.conf Rosé Pine Dawn;
kitty +kitten themes --reload-in all --config-file-name kitty.conf Everforest Light Medium;

tmux set -g "window-style" "bg=default";
tmux set -g "window-active-style" "bg=default";

darkman set light;
# sed -i 's/Theme=\(.*\)/Theme=rose-pine-dawn/' ~/.config/fcitx5/conf/classicui.conf

echo "light";

