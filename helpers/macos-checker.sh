#!/bin/bash -l
. ./helpers/colors.sh
MACOS_VERSION=$(sw_vers -productVersion)
hr
title "Checking macOS"
hr
echo "macOS Version: $MACOS_VERSION"
./helpers/node-checker.sh
if [ $? -eq 1 ]; then
    exit 1
fi
./helpers/code-checker.sh
if [ $? -eq 1 ]; then
    exit 1
fi
./helpers/python-checker.sh
if [ $? -eq 1 ]; then
    exit 1
fi
./helpers/docker-checker.sh
if [ $? -eq 1 ]; then
    exit 1
fi
