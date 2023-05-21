if status is-interactive
    # Commands to run in interactive sessions can go here
end

# pnpm
set -gx PNPM_HOME "/home/mayapony/.local/share/pnpm"
set -gx PATH "$PNPM_HOME" $PATH
# pnpm end

starship init fish | source
fish_config theme choose "Rosé Pine"
