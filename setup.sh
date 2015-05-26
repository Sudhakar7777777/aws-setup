#!/bin/bash
# Simple setup.sh for configuring Ubuntu 12.04 LTS EC2 instance
# for headless setup. 

# Install nvm: node-version manager
# https://github.com/creationix/nvm
sudo apt-get install -y git
sudo apt-get install -y curl
curl https://raw.github.com/creationix/nvm/master/install.sh | sh

# Load nvm and install latest production node
#source $HOME/.nvm/nvm.sh
#nvm install v0.10.12
#nvm use v0.10.12

# Install rlwrap to provide libreadline features with node
# See: http://nodejs.org/api/repl.html#repl_repl
sudo apt-get install -y rlwrap

# Install emacs24
# https://launchpad.net/~cassou/+archive/emacs
sudo add-apt-repository -y ppa:cassou/emacs
sudo apt-get -qq update
sudo apt-get install -y emacs24-nox emacs24-el emacs24-common-non-dfsg

# Install Heroku toolbelt
# https://toolbelt.heroku.com/debian
wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh

# git pull and install aws-config as well
cd $HOME
if [ -d ./aws-config/ ]; then
    mv aws-config aws-config.old
fi
if [ -d .emacs.d/ ]; then
    mv .emacs.d .emacs.d~
fi
git clone https://github.com/Sudhakar7777777/aws-config.git
ln -sb aws-config/.screenrc .
ln -sb aws-config/.bash_profile .
ln -sb aws-config/.bashrc .
ln -sb aws-config/.bashrc_custom .
ln -sf aws-config/.emacs.d .

### Install node setup
# Updated the sudo package to latest
sudo apt-get update
# Install a special package
sudo apt-get install -y python-software-properties python g++ make
# Add a new repository for apt-get to search
sudo add-apt-repository ppa:chris-lea/node.js
# Update apt-get's knowledge of which packages are where
sudo apt-get update
# Now install nodejs and npm
sudo apt-get install -y nodejs
# Verify the version for node & npm
npm --version
node --version

# Install jshint to allow checking of JS code within emacs
# http://jshint.com/
sudo npm install -g jshint

### Install script Complete
echo "Installation Completed, please review logs to ensure there is no errors found"
