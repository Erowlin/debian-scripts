#!/bin/bash
# Simple script to make the default updates and installation on the server.

echo 'Updating packages...'
aptitude update
aptitude upgrade

echo 'Installing base packages...'
aptitude install -y sudo build-essential subversion git automake libtool emacs23-nox  unzip unrar-free curl libncurses-dev

echo 'Installing Apache / Php5 packages'
aptitude install -y apache2 php5 php5-cli php5-curl
aptitude install -y libapache2-mod-scgi

