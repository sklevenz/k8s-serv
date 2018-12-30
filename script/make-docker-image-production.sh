#!/usr/bin/env bash

set -e

SOURCE="${0%/*}"
VERSION=$1

if [ "$VERSION" == "" ]; then
    echo Usage: make-docker-image VERSION
    exit 0
fi

pushd "$SOURCE/../docker/production"
  docker build -t sklevenz/k8s-serv:$VERSION --build-arg VERSION=$VERSION .
  docker build -t sklevenz/k8s-serv:latest --build-arg VERSION=$VERSION .
  docker push sklevenz/k8s-serv
popd
