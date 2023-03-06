#if test $TERM = "xterm-256color" && not set -q TMUX
#  set -g TMUX tmux new-session -d -s base
#  eval $TMUX
#  tmux attach-session -d -t base
#end

