#!/usr/bin/env bash

set -e

SOURCE="${0%/*}"
VERSION=$1

if [ "$VERSION" == "" ]; then
    echo Usage: delete-release VERSION
    exit 0
fi

git push origin :"$VERSION"
git tag --delete "$VERSION"
