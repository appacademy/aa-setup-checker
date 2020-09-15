#!/bin/sh
MACOS_VERSION=$(sw_vers -productVersion)
echo "Checking macOS"
echo "=============="
echo "macOS Version: $MACOS_VERSION"
sh ./helpers/node-checker.sh
sh ./helpers/code-checker.sh
sh ./helpers/docker-checker.sh
echo "macOS OK"
echo "--------------"
echo "Congratulations, you have everything installed properly!"
