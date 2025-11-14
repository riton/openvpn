#!/bin/bash

PREFIX="/opt/openvpn"

if [ ! -f "./configure" ]
then

  echo "Installing build dependencies"
  sudo apt install -y python3-docutils \
    libpam-dev \
    liblzo2-dev \
    liblz4-dev \
    libssl-dev \
    libnl-genl-3-dev \
    libcap-ng-dev \
    libtool \
    gcc \
    automake \
    make \
    binutils

  ./autogen.sh
  if [ $? -ne 0 ]
  then
    echo "autogen failed" >&2
    exit 1
  fi
fi

./configure --prefix="${PREFIX}"
if [ $? -ne 0 ]
then
  echo "Configure failed" >&2
  exit 1
fi

make clean

make
if [ $? -ne 0 ]
then
  echo "Make failed" >&2
  exit 2
fi

make install
if [ $? -ne 0 ]
then
  echo "Make install failed" >&2
  exit 3
fi

exit 0
