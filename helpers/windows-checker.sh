#!/bin/sh
. ./helpers/wsl2-checker.sh
if [ $? -eq 1 ]; then
    exit 1
fi
. ./helpers/ubuntu-checker.sh
if [ $? -eq 1 ]; then
    exit 1
fi

