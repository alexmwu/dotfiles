#!/usr/bin/env bash

# Install command-line tools.

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Xcode command line tools
xcode-select --install;

# Install pip/pip-related setup
sudo easy_install pip
sudo pip install -U setuptools

# Install Brew Cask
brew install caskroom/cask/brew-cask
brew tap caskroom/versions

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Useful macOS apps
brew cask install iterm2;
brew cask install spectacle;
brew cask install intellij-idea-ce;
brew cask install postman;
# tmux (terminal pane/window manager) + useful utilities
brew install tmux
brew install reattach-to-user-namespace
gem install tmuxinator

brew install zsh

# Install Bash 4.
# ***Note***: don’t forget to add `/usr/local/bin/bash` to `/etc/shells` before
# running `chsh`.
# brew install bash
# brew tap homebrew/versions
# brew install bash-completion2

# Install GNU core utilities (those that come with OS X are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils

# pkg-config finds installed libraries on system
brew install pkg-config

brew install autojump
brew install cmake
# Install Exuberant ctags
brew install ctags
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
brew install fswatch
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names
# Install Node.js and npm
brew install node
# Install rbenv and rbenv-build
brew install rbenv
# faster ack
brew install the_silver_searcher
# Install `wget` with IRI support.
brew install wget --with-iri
# Install python 3
brew install python3


# Install more recent versions of some OS X tools.
# brew install vim --override-system-vi
brew install neovim
brew install homebrew/dupes/grep
brew install homebrew/dupes/openssh
brew install homebrew/dupes/screen
brew install homebrew/php/php55 --with-gmp

# irc client
#brew install weechat --with-perl --with-python

brew install ack
# #brew install exiv2
brew install git
brew install git-lfs
brew install tig
brew install htop
brew install jq
# brew install imagemagick --with-webp
# brew install lua
brew install haskell-platform
# brew install lynx
# brew install p7zip
# brew install pigz
# brew install pv
# brew install rename
# brew install rhino
# brew install speedtest_cli
# brew install ssh-copy-id
# brew install tree
# brew install webkit2png
# brew install zopfli

# Install font tools.
# brew tap bramstein/webfonttools
# brew install sfnt2woff
# brew install sfnt2woff-zopfli
# brew install eoff2

# Install some CTF tools; see https://github.com/ctfs/write-ups.
# brew install aircrack-ng
# brew install bfg
# brew install binutils
# brew install binwalk
# brew install cifer
# brew install dex2jar
# brew install dns2tcp
# brew install fcrackzip
# brew install foremost
# brew install hashpump
# brew install hydra
# brew install john
# brew install knock
# brew install nmap
# brew install pngcheck
# brew install socat
# brew install sqlmap
# brew install tcpflow
# brew install tcpreplay
# brew install tcptrace
# brew install ucspi-tcp # `tcpserver` etc.
brew install watch
# brew install xpdf
# brew install xz

# Install diff so fancy (better git diffs)
npm install -g diff-so-fancy

gem install bundler

pip install decorator
brew install ipython

# Install Atom and packages
brew cask install atom

# Install Hydrogen
brew install zeromq
apm install hydrogen

apm install atom-beautify
apm install atom-ctags
apm install atom-ide-ui
apm install atom-ternjs
apm install atom-typescript
apm install auto-detect-indentation
apm install autoclose-html
apm install git-blame
apm install git-time-machine
apm install linter
apm install merge-conflicts
apm install open-recent
apm install pigments
apm install sort-lines
apm install vim-mode-plus

# Install prezto
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

# Remove outdated versions from the cellar.
brew cleanup

