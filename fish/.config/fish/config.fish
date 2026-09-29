if status is-interactive
    # Commands to run in interactive sessions can go here

    eval (/opt/homebrew/bin/brew shellenv fish)

    set -x EZA_CONFIG_DIR ~/.config/eza
    set -x FZF_DEFAULT_OPTS_FILE ~/.config/fzf/config

    fish_config theme choose solarized

    starship init fish | source

    if not set -q TMUX
      exec tmux
    end
end
