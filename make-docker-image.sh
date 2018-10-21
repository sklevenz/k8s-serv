#!/usr/bin/env bash

set -e

VERSION=$1

if [ "$VERSION" == "" ]; then
    echo Usage: make-docker-image VERSION
    exit 0
fi

docker build -t sklevenz/k8s-serv:$VERSION --build-arg VERSION=$VERSION .
docker build -t sklevenz/k8s-serv:latest --build-arg VERSION=$VERSION .

