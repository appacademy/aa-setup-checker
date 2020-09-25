#!/bin/sh
MACOS_VERSION=$(sw_vers -productVersion)
echo "Checking macOS"
echo "=============="
echo "macOS Version: $MACOS_VERSION"
. ./helpers/node-checker.sh
if [ $? -eq 1 ]; then
    exit 1
fi
. ./helpers/code-checker.sh
if [ $? -eq 1 ]; then
    exit 1
fi
. ./helpers/python-checker.sh
if [ $? -eq 1 ]; then
    exit 1
fi
. ./helpers/docker-checker.sh
if [ $? -eq 1 ]; then
    exit 1
fi
echo "macOS OK"
echo "--------------"
echo "Congratulations, you have everything installed properly!"
