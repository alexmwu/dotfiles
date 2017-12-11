#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Need to run git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
# May have to run
# git submodule update --init --recursive

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# check if OS is OSX. if so, add this check
if [[ `uname` == 'Darwin' ]]; then
    export PATH="$HOME/.rbenv/bin:$PATH";
    eval "$(rbenv init -)";
fi

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,exports,bash_aliases,functions,extra}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# History size
SAVEHIST=10000
HISTSIZE=10000
HISTFILE=~/.zsh_history
# Append to zsh history file, rather than overwriting it
setopt APPEND_HISTORY
# Add to history immediately
setopt INC_APPEND_HISTORY
# More history info, e.g., timestamps
setopt EXTENDED_HISTORY
# Remove duplicates from search
setopt HIST_FIND_NO_DUPS
# Share history between shells
setopt SHARE_HISTORY

# allow clobbering on redirect
setopt clobber

# explicitly set emacs mode
bindkey -e

# fix sudo autocorrecting issue in zsh
alias sudo='nocorrect sudo'


source ~/.zprofile;

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

