#!/bin/sh
DOCKER=$(which docker)
DOCKER_VERSION=$(docker --version)

echo "Checking Docker"
echo "==============="
echo "Docker Binary: ${DOCKER}"
echo "Docker Version: ${DOCKER_VERSION}"

if [ -z "$DOCKER" ]; then
    echo "You don't appear to have docker installed or haven't "
    echo "enabled the WSL 2 Docker integration"
    exit 1;
fi

DOCKER_HELLO_WORLD=$(docker run hello-world)
DOES_DOCKER_WORK=$(echo $DOCKER_HELLO_WORLD | grep -c "Hello from Docker");

if [ $DOES_DOCKER_WORK != 1 ]; then
    echo "Docker hello world didn't function properly"
    echo "Make sure docker is installed and running properly"
    echo $DOCKER_HELLO_WORLD
    exit 1;
fi

echo "Docker is OK"
echo "---------------"