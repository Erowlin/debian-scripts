#!/bin/bash

echo 'Updating packages...'
aptitude update
aptitude upgrade

echo 'Installing base packages...'
aptitude install sudo build-essential subversion git automake libtool emacs-nox  unzip unrar-free curl libncurses-dev

echo 'Installing Apache / Php5 packages'
aptitude install apache2 php5 php5-cli php5-curl
aptitude install libapache2-mod-scgi