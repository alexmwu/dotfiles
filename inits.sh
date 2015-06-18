#!/usr/bin/env bash

#Github ssh key setup. replace with your email

#generate key
#ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
#add ssh key to ssh-agent
#ssh-add ~/.ssh/id_rsa
#add to github via user settings under SSH Keys

# Basic git config name and email setup
#git config --global user.name "Your name"
#git config --global user.email yourname@example.com

#makes the ~/.gitignore the root gitignore; already in 
#.gitconfig. ignore this
#git config --global core.excludesfile '~/.gitignore'

#already in config. ignore
#matching means git push will push all local branches to the ones with same name on remote.
#simple means git push will push only current branch to one that git pull would pull from 
#it also checks that their names match.
#git config --global push.default simple
