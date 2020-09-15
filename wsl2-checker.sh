#!/bin/sh

LTS_NODE_VERSION=12

WSL=$(which wsl.exe)
WSL_VERSION=$(wsl.exe -l -v | tr -d '\0' | grep Ubuntu | awk '{print $4}' | tr -d '\n\r')
NODE=$(which node)
NODE_IS_FROM_NVM=$(echo $NODE | grep -c ".nvm")
NODE_VERSION=$(node --version)
NODE_IS_LTS=$(echo $NODE_VERSION | grep -c $LTS_NODE_VERSION)
MOCHA=$(which mocha)
MOCHA_IS_FROM_NVM=$(echo $MOCHA | grep -c ".nvm")
DOCKER=$(which docker)
DOCKER_VERSION=$(docker --version)

echo "Configuration"
echo "-------------"
echo "WSL Version: $WSL_VERSION"
echo "Shell: $SHELL"
echo "Node Version: $NODE_VERSION"
echo "Node Binary: $NODE"
echo "Mocha Binary: $MOCHA"
echo "Docker Version: $DOCKER_VERSION"
echo "-------------"

if [ -z "$WSL" ]; then
    echo "WSL doesn't appear to be installed."
    exit 1;
fi

if [ $WSL_VERSION != "2" ]; then
    echo "WSL for Ubuntu is not version 2."
    echo "Please run 'wsl --set-version Ubuntu 2' from Powershell"
    exit 1;
fi

if [ ! -d $HOME/.nvm ]; then
    echo "NVM isn't installed into your home directory"
    echo "Please visit the nvm website and install it"
    exit 1;
fi

if [ $SHELL = '/bin/zsh' ]; then
    echo "You are running ZSH"
    if [ ! -f $HOME/.zshrc ]; then
        echo "You don't have a .zshrc but are running zsh"
        echo "Please create one and put the NVM startup lines in it"
        exit 1;
    fi
    NVM_LINES="$(cat $HOME/.zshrc | grep -c NVM)"
    if [ $NVM_LINES != '3' ]; then
        echo "Couldn't find the NVM configuration lines in your ~/.zshrc"
        echo "Please add them"
        exit 1;
    fi
fi

if [ $SHELL = '/bin/bash' ]; then
    echo "You are running Bash";
    FOUND=0
    if [ -f $HOME/.bashrc ]; then
        echo "You have a .bashrc"
        NVM_LINES="$(cat $HOME/.bashrc | grep -c NVM)"
        if [ $NVM_LINES = '3' ]; then
          BASHRC=1
          echo "Found NVM setup in the .bashrc file"
          FOUND=1
        fi
    fi
    if [ -f $HOME/.profile ]; then
        echo "You have a .profile"
        NVM_LINES="$(cat $HOME/.profile | grep -c NVM)"
        if [ $NVM_LINES = '3' ]; then
          PROFILE=1
          echo "Found NVM setup in the .profile file"
          FOUND=1
        fi
    fi
    if [ -f $HOME/.bash_profile ]; then
        echo "You have a .bash_profile"
        NVM_LINES="$(cat $HOME/.bash_profile | grep -c NVM)"
        if [ $NVM_LINES = '3' ]; then
          BASH_PROFILE=1
          echo "Found NVM setup in the .bash_profile file"
          FOUND=1
        fi
    fi
    if [ $FOUND = 0 ]; then
       echo "Couldn't find the NVM setup lines in any of your bash startup files"
       echo "Please add them to the appropriate startup file"
       exit 1;
    fi
fi

if [ -z "$NVM_DIR" ]; then
    echo "NVM isn't initialized properly, even though it's in your startup files"
    echo "Please check which files are running when you start your shell"
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

CODE=$(which code)

if [ -z "$CODE" ]; then
    echo "You don't have Visual Studio Code installed properly"
    echo "Please reinstall it"
    exit 1;
fi

# Check for Docker

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

echo "Congratulations, you have everything installed properly!"
