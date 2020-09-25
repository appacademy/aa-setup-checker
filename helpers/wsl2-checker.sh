#!/bin/sh
WSL=$(which wsl.exe)
WSL_VERSION=$(wsl.exe -l -v | tr -d '\0' | grep Ubuntu | awk '{print $4}' | tr -d '\n\r')

echo -n "${F_BOLD}${C_WHITE}"
echo "Checking WSL"
echo "============"
echo -n $NO_FORMAT
echo "WSL Version: $WSL_VERSION"

if [ -z "$WSL" ]; then
    echo -n $C_RED
    echo "WSL doesn't appear to be installed."
    echo -n $NO_FORMAT
    exit 1;
fi

if [ $WSL_VERSION != "2" ]; then
    echo -n $C_RED
    echo "WSL for Ubuntu is not version 2."
    echo "Please run 'wsl --set-version Ubuntu 2' from Powershell"
    echo -n $NO_FORMAT
    exit 1;
fi
echo -n $C_GREEN
echo "WSL is OK"
echo -n $NO_FORMAT
echo -n "${F_BOLD}${C_WHITE}"
echo "-------------"
echo -n $NO_FORMAT