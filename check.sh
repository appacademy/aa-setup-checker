#!/bin/sh
export NO_FORMAT="\033[0m"
export C_GREEN="\033[38;5;10m"
export C_RED="\033[38;5;196m"
export F_BOLD="\033[1m"
export C_WHITE="\033[38;5;15m"

IS_MACOS=$(uname -a | awk '{ print $1 }' | grep -c Darwin)
IS_WINDOWS=$(which cmd.exe | grep -c -v 'not found')
LSB_RELEASE=$(which lsb_release | grep -c -v 'not found')
if [ $LSB_RELEASE = 1 ]; then
    IS_UBUNTU=$(lsb_release -s -i | grep -c "Ubuntu")
fi

if [ $IS_MACOS = 1 ]; then
    bash ./helpers/macos-checker.sh
    if [ $? -eq 1 ]; then
        exit 1
    fi
    exit 0
fi

if [ $IS_WINDOWS = 1 ]; then
    bash ./helpers/windows-checker.sh
    if [ $? -eq 1 ]; then
        exit 1
    fi
    exit 0
fi

if [ $IS_UBUNTU = 1 ]; then
    bash ./helpers/ubuntu-checker.sh
    if [ $? -eq 1 ]; then
        exit 1
    fi
    exit 0
fi

echo -n $C_RED
echo "Unknown Operating System, checker script not supported"
echo -n $NO_FORMAT
