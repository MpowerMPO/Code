#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR/..

DOCKER_IMAGE=${DOCKER_IMAGE:-mpowerpay/mpowerd-develop}
DOCKER_TAG=${DOCKER_TAG:-latest}

BUILD_DIR=${BUILD_DIR:-.}

rm docker/bin/*
mkdir docker/bin
cp $BUILD_DIR/src/mpowerd docker/bin/
cp $BUILD_DIR/src/mpower-cli docker/bin/
cp $BUILD_DIR/src/mpower-tx docker/bin/
strip docker/bin/mpowerd
strip docker/bin/mpower-cli
strip docker/bin/mpower-tx

docker build --pull -t $DOCKER_IMAGE:$DOCKER_TAG -f docker/Dockerfile docker
