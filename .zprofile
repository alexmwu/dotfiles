# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH"

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

# Append to zsh history file, rather than overwriting it
setopt APPEND_HISTORY

# allow clobbering on redirect
setopt clobber

# fix sudo autocorrecting issue in zsh
alias sudo='nocorrect sudo'

# VIM
export EDITOR='vim';

