#!/bin/bash -l
. ./helpers/colors.sh
DOCKER=$(which docker)
DOCKER_VERSION=$(docker --version)

hr
title "Checking Docker"
hr
echo "Docker Binary: ${DOCKER}"
echo "Docker Version: ${DOCKER_VERSION}"

if [ -z "$DOCKER" ]; then
    c_red "You don't appear to have docker installed or haven't "
    c_red "enabled the WSL 2 Docker integration"
    exit 1;
fi

DOCKER_HELLO_WORLD=$(docker run hello-world)
DOES_DOCKER_WORK=$(echo $DOCKER_HELLO_WORLD | grep -c "Hello from Docker");

if [ $DOES_DOCKER_WORK != 1 ]; then
    c_red "Docker hello world didn't function properly"
    c_red "Make sure docker is installed and running properly"
    c_red $DOCKER_HELLO_WORLD
    exit 1;
fi

c_green "Docker is OK"