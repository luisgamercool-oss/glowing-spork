#!/bin/bash

set -e

basedir=$(pwd)

applyPatches() {
    from=$1
    to=$2

    git clone "$1" "$2"
    pushd "$2"
    git remote add upstream "../$from"
    git fetch upstream
    git reset --hard upstream/master
    git am --abort > /dev/null 2>&1
    git am --3way --no-gpg-sign --ignore-whitespace "$basedir/${from}-patches/"*.patch
    popd
}

applyPatches launcher olauncher || exit 1
