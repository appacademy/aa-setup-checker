#!/bin/sh

UBUNTU_VERSION=$(lsb_release -r -s)

echo "Checking Ubuntu"
echo "==============="
echo "Ubuntu Version: $UBUNTU_VERSION"
echo "Shell: $SHELL"

# Check for Docker
sh ./helpers/node-checker.sh
sh ./helpers/docker-checker.sh
sh ./helpers/code-checker.sh

echo "Ubuntu is OK"
echo "---------------"

echo "Congratulations, you have everything installed properly!"
