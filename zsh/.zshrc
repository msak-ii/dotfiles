export PATH="/opt/homebrew/opt/llvm/bin:$PATH"

eval "$(sheldon source)"
eval "$(starship init zsh)"

alias ll="ls -Gal"
alias tree="tree -C"
alias brewup='brew update && brew upgrade && brew upgrade --cask --greedy'

alias cdd='cd ~/dotfiles/'
alias cdn='cd ~/dotfiles/nvim/.config/nvim/'
