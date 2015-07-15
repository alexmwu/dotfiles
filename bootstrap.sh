#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

git pull origin master;

# .osx for osx not terminal configurations
# inits.sh for some initial setup
# init has preference files
function doIt() {
	rsync --exclude ".git/" --exclude ".DS_Store" --exclude "bootstrap.sh" --exclude ".osx" --exclude "inits.sh" --exclude "init/" \
		--exclude "README.md" --exclude "LICENSE-MIT.txt" --exclude "brew.sh" -avh --no-perms . ~;
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



# Basic git config name and email setup
echo "Please enter git name: "
read git_name
git config --global user.name git_name
echo "Please enter git email: "
read git_email
git config --global user.email git_email

# Make home gitignore global gitignore
git config --global core.excludesfile '~/.gitignore'
