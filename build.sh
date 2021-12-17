#!/bin/bash

# reading configuration


VERSION=17
TAG=2021-11-17
MYHUBID=aeadataeditor
MYIMG=jep-2021-1239
STATALIC=$(find $HOME/Dropbox/ -name stata.lic.$VERSION | tail -1)

cp $STATALIC stata.lic.${VERSION}
mkdir output cleandata
DOCKER_BUILDKIT=1 docker build  . \
  --secret id=statalic,src=stata.lic.${VERSION} \
  -t $MYHUBID/${MYIMG}:$TAG