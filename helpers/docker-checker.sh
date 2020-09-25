#!/bin/sh
DOCKER=$(which docker)
DOCKER_VERSION=$(docker --version)

echo -n "${F_BOLD}${C_WHITE}"
echo "Checking Docker"
echo "==============="
echo -n $NO_FORMAT
echo "Docker Binary: ${DOCKER}"
echo "Docker Version: ${DOCKER_VERSION}"

if [ -z "$DOCKER" ]; then
    echo -n $C_RED
    echo "You don't appear to have docker installed or haven't "
    echo "enabled the WSL 2 Docker integration"
    echo -n $NO_FORMAT
    exit 1;
fi

DOCKER_HELLO_WORLD=$(docker run hello-world)
DOES_DOCKER_WORK=$(echo $DOCKER_HELLO_WORLD | grep -c "Hello from Docker");

if [ $DOES_DOCKER_WORK != 1 ]; then
    echo -n $C_RED
    echo "Docker hello world didn't function properly"
    echo "Make sure docker is installed and running properly"
    echo $DOCKER_HELLO_WORLD
    echo -n $NO_FORMAT
    exit 1;
fi

echo -n $C_GREEN
echo "Docker is OK"
echo -n $NO_FORMAT
echo -n $F_BOLD
echo "---------------"
echo -n $NO_FORMAT