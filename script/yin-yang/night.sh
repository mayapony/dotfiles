#!/bin/bash
# kitty +kitten themes --reload-in all --config-file-name kitty.conf Catppuccin-Mocha;

# tmux set -g window-style 'bg=#1e1e2e';
tmux set -g @catppuccin_flavour 'mocha';
~/.tmux/plugins/tpm/tpm;

tmux set -g "window-style" "bg=default";
tmux set -g "window-active-style" "bg=default";
tmux set -g status-bg default;
tmux set-option -g status-style bg=default;

darkman set dark;

echo "night";
