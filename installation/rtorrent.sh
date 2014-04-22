#!/bin/bash
# RTorrent Compilation and Installation

username = "rutorrent"

echo 'Installing packages...'

aptitude update && aptitude install -y apache2 apache2-utils autoconf build-essential ca-certificates comerr-dev libapache2-mod-php5 libcloog-ppl-dev libcppunit-dev libcurl3 libcurl4-openssl-dev libncurses5-dev ncurses-base ncurses-term libterm-readline-gnu-perl libsigc++-2.0-dev libssl-dev libtool libxml2-dev ntp openssl patch libperl-dev php5 php5-cli php5-dev php5-fpm php5-curl php5-geoip php5-mcrypt php5-xmlrpc pkg-config python-scgi dtach ssl-cert subversion unrar zlib1g-dev pkg-config unzip htop irssi curl cfv

echo 'Activate SSL and auth_digest for apache2'

a2enmod ssl
a2enmod auth_digest

echo 'Set Timeout to minimum 30 and ServerTokens to Prod'
emacs /etc/apache2/apache2.conf


# Certificate creation for https
echo 'Create SSL certificate'
openssl req -new -x509 -days 365 -nodes -newkey rsa:2048 -out /etc/apache2/apache.pem -keyout /etc/apache2/apache.pem
chmod 600 /etc/apache2/apache.pem


echo 'Creating a password protection for Apache'
htdigest -c /etc/apache2/htpasswd rutorrent $username


emacs /etc/apache2/sites-available/default
a2ensite default-ssl

echo 'Activate SSL with ports 443'
emacs /etc/apache2/ports.conf

/etc/init.d/apache2 restart