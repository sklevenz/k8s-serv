#!/usr/bin/env bash

set -e

VERSION=$1

if [ "$VERSION" == "" ]; then
    echo Usage: make-release VERSION
    exit 0
fi

 git tag -a $VERSION -m "new release version: $VERSION"
 git push origin $VERSION
 goreleaser --rm-dist

