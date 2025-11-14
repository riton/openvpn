#!/bin/bash -xe

TAR_ARCHIVE="${1}"
OPENVPN_VERSION="${2}"

if [ -z "${TAR_ARCHIVE}" ]
then
  echo "TAR_ARCHIVE missing" >&2
  exit 1
fi

if [ -z "${OPENVPN_VERSION}" ]
then
  echo "OPENVPN_VERSION missing" >&2
  exit 1
fi

docker run --rm -e "OPENVPN_VERSION=${OPENVPN_VERSION}" -v "${TAR_ARCHIVE}:/openvpn.tar:ro" -v "$(pwd)":/src remiferrand/fpm:latest /src/docker-build-deb-package.sh
