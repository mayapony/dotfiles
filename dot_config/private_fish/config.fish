if status is-interactive
end

set -gx COLORTERM truecolor
set -gx EDITOR nvim
set -g fish_key_bindings fish_vi_key_bindings
set -g fish_bind_mode insert

# Title options
set -g theme_title_display_process yes
set -g theme_title_display_path yes
set -g theme_title_display_user yes
set -g theme_title_use_abbreviated_path yes
set -g theme_display_vi yes

# pnpm
set -gx PNPM_HOME "$HOME/.local/share/pnpm"
set -gx PATH "$PNPM_HOME" $PATH
# pnpm end

# npm
set --export PATH "$HOME/.npm/bin:$PATH"

starship init fish | source
zoxide init fish | source


# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

if type -q exa
	alias ls "exa --icons -1"
	alias ll "exa --icons -l"
	alias la "exa --icons -a"
	# alias nvim "nvim --listen /tmp/nvim.pipe"
end

# @link https://www.joshmedeski.com/posts/popup-history-with-tmux-and-fzf/
# popup history with tmux and fzf
set -U FZF_CTRL_R_OPTS "--reverse"
set -U FZF_TMUX_OPTS "-p"

# add my script to PATH
export PATH="$HOME/.config/fish/scripts:$PATH"

# add .bin to PATH
export PATH="$HOME/.bin:$PATH"


