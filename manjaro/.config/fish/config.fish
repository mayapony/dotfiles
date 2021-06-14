if test -f /home/ice/.autojump/share/autojump/autojump.fish; . /home/ice/.autojump/share/autojump/autojump.fish; end

begin
    set --local AUTOJUMP_PATH $HOME/.autojump/share/autojump/autojump.fish
    if test -e $AUTOJUMP_PATH
        source $AUTOJUMP_PATH
    end
end

fish_vi_key_bindings
