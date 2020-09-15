#!/bin/sh

CODE=$(which code)
CODE_VERSION=$(code --version | head -n 1)

echo "Checking VSCode"
echo "==============="
echo "Code Binary: ${CODE}"
echo "Version: ${CODE_VERSION}"

if [ -z "$CODE" ]; then
    echo "You don't have Visual Studio Code installed properly"
    echo "Please reinstall it"
    exit 1;
fi

echo "VSCode is OK"
echo "---------------"