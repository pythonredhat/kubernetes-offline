#!/bin/bash

PACKAGE=kubernetes-offline

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

#prep spec file (some of this stuff is in Makefile already...)
cd /home/rpmbuild
if [ ! -f ./${PACKAGE}.spec ]; then
  echo Sorry, can not find rpm spec file
  exit 1
fi 

cp ${PACKAGE}.spec $HOME/rpmbuild/SPECS

#patch spec file with version, release, date
sed -i -e "s/##VERSION##/${VERSION}/" -e "s/##RELEASE##/${RELEASE}/" /home/rpmbuild/rpmbuild/SPECS/${PACKAGE}.spec
sed -i -e "s/##DATE##/`date +\"%a %b %d %Y\"`/" /home/rpmbuild/rpmbuild/SPECS/${PACKAGE}.spec

#build
autoreconf -i
./configure
make

#copy rpm to the artifact directory
if [[ -d /artifacts ]]; then 
  cp ./RPMS/noarch/${PACKAGE}*.rpm /artifacts/