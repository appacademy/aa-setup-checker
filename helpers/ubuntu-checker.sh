#!/bin/bash -l
. ./helpers/colors.sh

UBUNTU_VERSION=$(lsb_release -r -s)

hr
title "Checking Ubuntu"
hr
echo "Ubuntu Version: $UBUNTU_VERSION"

# Check shell
echo
./helpers/shell-checker.sh
if [ $? -eq 1 ]; then
  exit 1;
fi

# Check for Docker
echo
./helpers/node-checker.sh
if [ $? -eq 1 ]; then
    exit 1
fi
echo
./helpers/code-checker.sh
if [ $? -eq 1 ]; then
    exit 1
fi
echo
./helpers/python-checker.sh
if [ $? -eq 1 ]; then
    exit 1
fi
echo
./helpers/docker-checker.sh
if [ $? -eq 1 ]; then
    exit 1
fi


