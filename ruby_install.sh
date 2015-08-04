#!/bin/bash

###############################
# Linux ONLY
# This is done by brew for OSX
###############################

# install rbenv and ruby-build
git clone git://github.com/sstephenson/rbenv.git ~/.rbenv
git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build

echo 'eval "$(rbenv init -)"' >> ~/.bashrc
touch ~/.irb_history

rbenv install
rbenv global

# install helpful gems
gem install --no-ri --no-rdoc bundler tmuxinator hookup
rbenv rehash
