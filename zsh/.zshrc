eval "$(/opt/homebrew/bin/brew shellenv zsh)"
eval "$(sheldon source)"
eval "$(starship init zsh)"

alias brewdump="brew bundle dump --force --no-npm --no-vscode"
alias brewup="brew update && brew upgrade && brew upgrade --cask --greedy"

alias ll="ls -Gal"
alias tree="tree -Ca"

alias cdd="cd ~/dotfiles"
