#!/bin/bash
# openstf.sh

# rethinkdb
source /etc/lsb-release && echo "deb http://download.rethinkdb.com/apt $DISTRIB_CODENAME main" | sudo tee /etc/apt/sources.list.d/rethinkdb.list
wget -qO- https://download.rethinkdb.com/apt/pubkey.gpg | sudo apt-key add -

#
sudo apt-get update
sudo apt-get install git npm rethinkdb android-tools-adb python autoconf automake libtool build-essential ninja-build libzmq3-dev libprotobuf-dev graphicsmagick yasm stow

#nodejs
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt-get install -y nodejs

sudo npm install -g bower karma gulp

mkdir ~/Downloads

#ZeroMQ
cd ~/Downloads
wget http://download.zeromq.org/zeromq-4.1.4.tar.gz
tar -zxvf zeromq-4.1.4.tar.gz
cd zeromq-4.1.4
./configure --without-libsodium --prefix=/usr/local/stow/zeromq-4.1.4
make
sudo make install
cd /usr/local/stow
sudo stow -vv zeromq-4.1.4

#Google protobuf
cd ~/Downloads
git clone https://github.com/google/protobuf.git
cd protobuf
./autogen.sh
./configure --prefix=/usr/local/stow/protobuf-`git rev-parse --short HEAD`
make
sudo make install
cd /usr/local/stow
sudo stow -vv protobuf-*

sudo ldconfig

#OpenSTF
cd
mkdir openstf
cd openstf/
git clone https://github.com/openstf/stf.git
cd stf
sudo npm install -g stf --unsafe-perm

echo "Github: https://github.com/openstf/stf"
#Start services
echo "Run below commands in two different terminals as user not root: "
echo "rethinkdb"
echo "stf local --public-ip <your IP> --allow-remote"

echo "Below details to access interface:"
echo "URL: http://<your IP>:7100"
echo "user: administrator"
echo "email: administrator@fakedomain"
