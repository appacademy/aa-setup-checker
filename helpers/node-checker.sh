#!/bin/sh
LTS_NODE_VERSION=12

NODE=$(which node)
NODE_IS_FROM_NVM=$(echo $NODE | grep -c ".nvm")
NODE_VERSION=$(node --version)
NODE_IS_LTS=$(echo $NODE_VERSION | grep -c $LTS_NODE_VERSION)
NPM=$(which npm)
NPM_VERSION=$(npm --version)
MOCHA=$(which mocha)
MOCHA_VERSION=$(mocha --version)
MOCHA_IS_FROM_NVM=$(echo $MOCHA | grep -c ".nvm")

echo "Checking Node.JS"
echo "================"
echo "Node Binary: ${NODE}"
echo "Node Version: ${NODE_VERSION}"
echo "NPM Binary: ${NPM}"
echo "NPM Version: ${NPM_VERSION}"
echo "Mocha Binary: ${MOCHA}"
echo "Mocha Version: ${MOCHA_VERSION}"

if [ ! -d $HOME/.nvm ]; then
    echo "NVM isn't installed into your home directory"
    echo "Please visit the nvm website and install it"
    exit 1;
fi

if [ -z "$NVM_DIR" ]; then
    echo "NVM isn't initialized properly"
    echo "Please check your startup files for the correct NVM startup lines"
    exit 1;
fi

# Check node and version
if [ -z "$NODE" ]; then
    echo "Couldn't find the node bianry in your PATH. Check to make sure NVM"
    echo "is setup correctly"
    exit 1;
fi

if [ $NODE_IS_LTS != 1 ]; then
    echo "You aren't running the current LTS version of Node.JS (12)"
    echo "Please use nvm to update to the lts version"
    echo "Run 'nvm install --lts'"
    echo "Followed by 'nvm alias default lts/\*'"
    exit 1;
fi

if [ $NODE_IS_FROM_NVM != 1 ]; then
    echo "Your node version isn't coming from NVM"
    echo "Check to make sure you don't have node installed globally"
    echo "somewhere in your PATH"
    echo "Node binary = ${NODE}"
    exit 1;
fi

# Check for mocha install

if [ -z "$MOCHA" ]; then
    echo "You don't have mocha installed globally"
    echo "run 'npm install -g mocha' to install it"
    exit 1;
fi

if [ $MOCHA_IS_FROM_NVM != 1 ]; then
    echo "You have mocha but it's not coming from your nvm node instalation."
    echo "Please install mocah with 'npm install -g mocah'"
    echo "Mocha binary = ${MOCHA}"
    exit 1;
fi

echo "Node.JS is OK"
echo "----------------"