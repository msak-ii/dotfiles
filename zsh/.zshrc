eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(sheldon source)"
eval "$(starship init zsh)"

alias brewup="brew update && brew upgrade && brew upgrade --cask --greedy"

alias ll="ls -Gal"
alias tree="tree -Ca"

alias cdd="cd ~/dotfiles"
alias cdw="cd ~/dotfiles/wezterm/.config/wezterm"
alias cdn="cd ~/dotfiles/nvim/.config/nvim"
