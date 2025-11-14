#!/bin/bash -xe

if [ -z "${OPENVPN_VERSION}" ]
then
  echo "Missing OPENVPN_VERSION" >&2
  exit 1
fi

cd /tmp

tar xvf /openvpn.tar

fpm -s dir -t deb --license "GPL 2" -n "ritonfr-openvpn-with-client-hwaddr" -v "${OPENVPN_VERSION}" --url "https://github.com/riton/openvpn/tree/feature/client_hwaddr" --description "OpenVPN -- A Secure tunneling daemon - Includes client HWAddr spoof patch" --maintainer "Remi Ferrand <email@provider.org>" ./opt

mv /tmp/*.deb /src/
