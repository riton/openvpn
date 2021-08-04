#!/bin/bash

PREFIX="/opt/openvpn"

if [ ! -f "./configure" ]
then
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
