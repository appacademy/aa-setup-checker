#!/bin/sh
. ./helpers/colors.sh
MACOS_VERSION=$(sw_vers -productVersion)
f_bold "Checking macOS"
f_bold "=============="
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
c_green "macOS OK"
f_bold "--------------"
echo "Congratulations, you have everything installed properly!"
