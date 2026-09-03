export PATH="$(brew --prefix)/opt/llvm/bin:$PATH"
export PATH="$(brew --prefix)/opt/openjdk@25/bin:$PATH"
export JAVA_HOME="$(brew --prefix)/opt/openjdk@25/libexec/openjdk.jdk/Contents/Home"

eval "$(sheldon source)"
eval "$(starship init zsh)"

alias ll="ls -Gal"
alias tree="tree -C"
alias brewup='brew update && brew upgrade && brew upgrade --cask --greedy'

alias cdd='cd ~/dotfiles/'
alias cdn='cd ~/dotfiles/nvim/.config/nvim/'
