#!/bin/sh
. ./helpers/colors.sh

PYTHON=$(which python3)
PYTHON_VERSION=$(python3 --version | awk '{print $2}')
PYTHON_MAJOR_VERSION=$(echo $PYTHON_VERSION | cut -f 1 -d ".")
PYTHON_MINOR_VERSION=$(echo $PYTHON_VERSION | cut -f 2 -d ".")
IS_PYTHON_FROM_PYENV=$(echo $PYTHON | grep -c ".pyenv")
PIPENV=$(which pipenv)
PIPENV_VERSION=$(pipenv --version)

f_bold "Checking Python"
f_bold "==============="
echo "Python Binary: ${PYTHON}"
echo "Python Version: ${PYTHON_VERSION}"
echo "pipenv Binary: ${PIPENV}"
echo "pipenv Version: ${PIPENV}"

if [ -z $PYTHON ]; then
    c_red "Python is not installed"
    c_red "Please install Python 3.8"
    exit 1;
fi

if [ $IS_PYTHON_FROM_PYENV != 1 ]; then
    c_red "Python wasn't installed with pyenv"
    c_red "Please install pyenv first"
    c_red "and then use it to install python 3.8"
    exit 1;
fi

if [ $PYTHON_MAJOR_VERSION != 3 ]; then
    c_red "Python is not version 3"
    c_red "please install python 3.8"
    exit 1;
fi

if [ $PYTHON_MINOR_VERSION != 8 ]; then
    c_red "Python version is too low"
    c_red "Please install python 3.8"
    exit 1;
fi

if [ -z $PIPENV ]; then
    c_red "pipenv not installed"
    c_red "Please install pipenv"
    c_red "Run : 'pip install pipenv'"
    exit 1;
fi

if [ ! $PIPENV_VENV_IN_PROJECT ];then
    c_red "PIPENV_VENV_IN_PROJECT not set"
    c_red "Please add this line to your shell startup file:"
    echo
    c_red "export PIPENV_VENV_IN_PROJECT=1"
    exit 1;
fi

c_green "Python OK"
f_bold "==============="
