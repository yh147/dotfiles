#!/bin/bash

MODULE=$1
TIME=`date "+%Y%m%d%H%M"`
GIT_REVISION=`git log -1 --pretty=format:"%h"`
IMAGE_NAME=192.168.79.128/smh-service/${MODULE}:${TIME}_${GIT_REVISION}

cd ${MODULE}
docker build -t ${IMAGE_NAME} .
cd -
docker push ${IMAGE_NAME}
docker rmi ${IMAGE_NAME}
