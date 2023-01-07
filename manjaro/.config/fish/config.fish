if status is-interactive
    # Commands to run in interactive sessions can go here
    fish_vi_key_bindings
    set --local AUTOJUMP_PATH $HOME/.autojump/share/autojump/autojump.fish
    if test -e $AUTOJUMP_PATH
        source $AUTOJUMP_PATH
    end
    starship init fish | source
end

# pnpm
set -gx PNPM_HOME "/home/mayapony/.local/share/pnpm"
set -gx PATH "$PNPM_HOME" $PATH
# pnpm end