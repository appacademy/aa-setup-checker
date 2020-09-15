#!/bin/sh
sh ./helpers/wsl2-checker.sh
if [ $? -eq 1 ]; then
    exit 1
fi
sh ./ubuntu-checker.sh
if [ $? -eq 1 ]; then
    exit 1
fi

