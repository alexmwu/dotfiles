#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# check if OS is OSX. if so, add this check
if [[ `uname` == 'Darwin' ]]; then
    export PATH="$HOME/.rbenv/bin:$PATH";
    eval "$(rbenv init -)";
fi

# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH"

# Append to zsh history file, rather than overwriting it
setopt APPEND_HISTORY

# Easier navigation: .., ..., ...., ....., ~ and -
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias -- -="cd -"

# Shortcuts
alias d="cd ~/Documents"
alias dl="cd ~/Downloads"
alias dt="cd ~/Desktop"
alias p="cd ~/Projects"
alias g="git"
alias gs="git status"

alias vi="vim"
alias subl='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'

