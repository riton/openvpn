#!/bin/bash -xe

cp -ra /src /src-work

cd /src-work

apt update

apt upgrade -y

apt install -y sudo make

echo "Cleaning"

make maintainer-clean ||:

rm -f ./configure

echo "Building"

./build-helper.sh

echo "Generating a .tar archive"

tar cvf /src/openvpn-"$(date '+%s')".tar /opt/openvpn

echo "Done"
