#!/bin/bash

#build
autoreconf -i
./configure
make

#copy rpm to the artifact directory
if [[ -d /artifacts ]]; then 
  cp ./RPMS/noarch/${PACKAGE}*.rpm /artifacts/