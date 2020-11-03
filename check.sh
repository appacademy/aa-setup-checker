#!/bin/bash
source ./helpers/colors.sh
source ./helpers/utils.sh

IS_MACOS=$(uname -a | awk '{ print $1 }' | grep -c Darwin)
IS_WINDOWS=$(which cmd.exe | grep -c -v 'not found')
LSB_RELEASE=$(which lsb_release | grep -c -v 'not found')
if [ $LSB_RELEASE = 1 ]; then
    IS_UBUNTU=$(lsb_release -s -i | grep -c "Ubuntu")
    IS_DEBIAN=$(lsb_release -s -i | grep -c "Debian")
fi

success() {
    hr
    c_green "Congratulations, you have everything installed properly!"
    hr
}

if [ $IS_MACOS = 1 ]; then
    $SHELL -l ./helpers/macos-checker.sh
    if [ $? -eq 1 ]; then
        exit 1
    fi
    success
    exit 0
elif [ $IS_WINDOWS = 1 ]; then
    $SHELL -l ./helpers/windows-checker.sh
    if [ $? -eq 1 ]; then
        exit 1
    fi
    success
    exit 0
elif [ $IS_UBUNTU = 1 ]; then
    $SHELL ./helpers/ubuntu-checker.sh
    if [ $? -eq 1 ]; then
        exit 1
    fi
    success
    exit 0
elif [ $IS_DEBIAN = 1 ]; then
    $SHELL ./helpers/debian-checker.sh
    if [ $? -eq 1 ]; then
        exit 1
    fi
    success
    exit 0
else
    c_red "Unknown Operating System, checker script not supported"
fi
