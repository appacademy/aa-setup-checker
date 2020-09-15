#!/bin/sh
WSL=$(which wsl.exe)
WSL_VERSION=$(wsl.exe -l -v | tr -d '\0' | grep Ubuntu | awk '{print $4}' | tr -d '\n\r')

echo "Checking WSL"
echo "============"
echo "WSL Version: $WSL_VERSION"

if [ -z "$WSL" ]; then
    echo "WSL doesn't appear to be installed."
    exit 1;
fi

if [ $WSL_VERSION != "2" ]; then
    echo "WSL for Ubuntu is not version 2."
    echo "Please run 'wsl --set-version Ubuntu 2' from Powershell"
    exit 1;
fi
echo "WSL is OK"
echo "-------------"