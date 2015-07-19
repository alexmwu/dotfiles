#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

git pull origin master;

# .osx for osx not terminal configurations
# inits.sh for some initial setup
# init has preference files
function doIt() {
	rsync --exclude ".git/" --exclude ".DS_Store" --exclude "bootstrap.sh" --exclude ".osx" --exclude "init/" \
    --exclude "README.md" --exclude "LICENSE-MIT.txt" --exclude "Vagrantfile" --exclude "ruby_install.sh" \
    --exclude "install.sh" --exclude "linuxinstall/" -avh --no-perms . ~;
	source ~/.bash_profile;
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt;
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt;
	fi;
fi;
unset doIt;

# Install plugins
vim +PlugInstall +qa

# Basic git config name and email setup
if [ -t 1 ]; then
  echo "Please enter git name: "
  read git_name
  git config --global user.name "$git_name"
  echo "Please enter git email: "
  read git_email
  git config --global user.email "$git_email"
fi

# List git config
# git config --list
