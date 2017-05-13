#!/usr/bin/env bash

cd /home/vagrant

gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
\curl -L https://get.rvm.io | bash -s stable
source /home/vagrant/.rvm/scripts/rvm

rvm install $1
rvm use $1 --default

gem update --system
gem install bundler

gem install rails --version=$2