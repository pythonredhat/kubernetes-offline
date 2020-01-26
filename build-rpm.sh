#!/bin/bash

#set build number
if [ -z $BUILD_NUMBER ]; then 
  echo BUILD_NUMBER is not known, it is normally given by Gitlab
  exit 1
fi

RELEASE=$BUILD_NUMBER

#set version
if [ -z $VERSION ]; then
  echo VERSION is not set via parameter or via ENV, using version.txt
  VERSION=`cat version.txt`
fi

#build
autoreconf -i
./configure
make

#copy rpm to the artifact directory
if [[ -d /artifacts ]]; then 
  cp ./RPMS/noarch/${PACKAGE}*.rpm /artifacts/
fi