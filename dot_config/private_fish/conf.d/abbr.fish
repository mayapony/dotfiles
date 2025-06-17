#! /usr/bin/fish
abbr --add tree 'exa --icons --tree'
abbr --add sys 'sudo systemctl'
abbr --add c clear
abbr --add lg lazygit --ucd "~/.config/lazygit"
abbr --add vi nvim
abbr --add pac 'sudo pacman'
abbr --add ec 'emacsclient -nw'
abbr --add p paru
abbr --add pn pnpm
abbr --add pa pnpm add
abbr --add pi pnpm install
abbr --add pd pnpm add -D
abbr --add ya yazi
abbr --add j zi
abbr --add top btop
abbr --add df duf
abbr --add bf chezmoi

# git
abbr --add gst "git status"

function cpr
  rsync --archive -hh --partial --info=stats1,progress2 --modify-window=1 $argv  
end

function mvr 
	rsync --archive -hh --partial --info=stats1,progress2 --modify-window=1 --remove-source-files $argv
end
