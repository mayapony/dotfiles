#!/bin/bash
# kitty +kitten themes --reload-in all --config-file-name kitty.conf Catppuccin-Latte;

# tmux set -g window-style 'bg=#eff1f5';
tmux set -g @catppuccin_flavour 'latte';
~/.tmux/plugins/tpm/tpm;

tmux set -g "window-style" "bg=default";
tmux set -g "window-active-style" "bg=default";
tmux set -g status-bg default;
tmux set-option -g status-style bg=default;

darkman set light;

echo "light";

