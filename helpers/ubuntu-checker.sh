#!/bin/bash -l
. ./helpers/colors.sh

UBUNTU_VERSION=$(lsb_release -r -s)

f_bold "Checking Ubuntu"
f_bold "==============="
echo "Ubuntu Version: $UBUNTU_VERSION"
echo "Shell: $SHELL"

# Check for Docker
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

c_green "Ubuntu is OK"
f_bold "---------------"

echo "Congratulations, you have everything installed properly!"
