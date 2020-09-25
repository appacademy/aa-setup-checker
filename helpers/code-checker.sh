#!/bin/sh

CODE=$(which code)
CODE_VERSION=$(code --version | head -n 1)

echo -n "${F_BOLD}${C_WHITE}"
echo "Checking VSCode"
echo "==============="
echo -n $NO_FORMAT
echo "Code Binary: ${CODE}"
echo "Version: ${CODE_VERSION}"

if [ -z "$CODE" ]; then
    echo -n $C_RED
    echo "You don't have Visual Studio Code installed properly"
    echo "Please reinstall it"
    echo -n $NO_FORMAT
    exit 1;
fi

echo -n $C_GREEN
echo "VSCode is OK"
echo -n $NO_FORMAT
echo -n "${F_BOLD}${C_WHITE}"
echo "---------------"
echo -n $NO_FORMAT