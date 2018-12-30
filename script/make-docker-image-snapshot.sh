#!/usr/bin/env bash

set -e

SOURCE="${0%/*}"
VERSION=$1

if [ "$VERSION" == "" ]; then
    echo Usage: make-docker-image-snapshot VERSION
    exit 0
fi

env GOOS=linux GOARCH=386 go build -o k8s-serv-386

pushd "$SOURCE/../docker/snapshot"
  cp ../../k8s-serv-386 k8s-serv
  docker build -t sklevenz/k8s-serv:$VERSION --build-arg VERSION=$VERSION .
  docker build -t sklevenz/k8s-serv:snapshot --build-arg VERSION=$VERSION .
  docker push sklevenz/k8s-serv
  rm k8s-serv
popd
