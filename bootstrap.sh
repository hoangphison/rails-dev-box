#!/usr/bin/env bash

echo 'Updating Package Information'
sudo apt-get -y update  >/dev/null 2>&1

echo 'Installing Development Tools'
sudo apt-get -y build-essential git curl >/dev/null 2>&1

echo 'Installing ExecJS Runtime'
sudo apt-get -y nodejs >/dev/null 2>&1

echo 'Installing MySQL'
debconf-set-selections <<< 'mysql-server mysql-server/root_password password root'
debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password root'
sudo apt-get install -y mysql-server mysql-client libmysqlclient-dev >/dev/null 2>&1

echo 'Installing SQLite'
sudo apt-get install -y sqlite3 libsqlite3-dev >/dev/null 2>&1

echo 'Installing Imagemagick'
sudo apt-get install -y imagemagick >/dev/null 2>&1

echo 'Setting Up Ruby'
su -c "bash /vagrant/ruby.sh $1 $2 >/dev/null 2>&1" vagrant

echo 'All done installing!'