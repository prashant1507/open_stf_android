# open_stf_android

Steps:

apt install vim (Optional)
apt install curl (Optional)
apt install docker.io

// RethinkDB
docker pull rethinkdb
// ADB
docker pull sorccu/adb
STF
docker pull openstf/stf

// To save images to offline machine
docker pull <Image>>
docker save <Image> > <Name>.tar

// To load
docker load -i Name.tar

// To list images
docker image ls

// to run dockers file
sudo docker-compose -f openstfDocker.yml up

http://<IP>>:7100/#!/devices

API: https://github.com/openstf/stf/blob/master/doc/API.md
curl -H "Authorization: Bearer TOKEN" -i http://<IP>>:7100/api/v1/devices

iOS:  https://github.com/tmobile/stf_ios_support
