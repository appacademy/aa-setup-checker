#!/bin/sh

PYTHON=$(which python3)
PYTHON_VERSION=$(python3 --version | awk '{print $2}')
PYTHON_MAJOR_VERSION=$(echo $PYTHON_VERSION | cut -f 1 -d ".")
PYTHON_MINOR_VERSION=$(echo $PYTHON_VERSION | cut -f 2 -d ".")
IS_PYTHON_FROM_PYENV=$(echo $PYTHON | grep -c ".pyenv")
PIPENV=$(which pipenv)
PIPENV_VERSION=$(pipenv --version)

echo "Checking Python"
echo "==============="
echo "Python Binary: ${PYTHON}"
echo "Python Version: ${PYTHON_VERSION}"
echo "pipenv Binary: ${PIPENV}"
echo "pipenv Version: ${PIPENV}"

if [ -z $PYTHON ]; then
    echo "Python is not installed"
    echo "Please install Python 3.8"
    exit 1;
fi

if [ $IS_PYTHON_FROM_PYENV != 1 ]; then
    echo "Python wasn't installed with pyenv"
    echo "Please install pyenv first"
    echo "and then use it to install python 3.8"
    exit 1;
fi

if [ $PYTHON_MAJOR_VERSION != 3 ]; then
    echo "Python is not version 3"
    echo "please install python 3.8"
    exit 1;
fi

if [ $PYTHON_MINOR_VERSION != 8 ]; then
   echo "Python version is too low"
   echo "Please install python 3.8"
   exit 1;
fi

if [ -z $PIPENV ]; then
    echo "pipenv not installed"
    echo "Please install pipenv"
    echo "Run : 'pip install pipenv'"
    exit 1;
fi

if [ ! $PIPENV_VENV_IN_PROJECT ];then
    echo "PIPENV_VENV_IN_PROJECT not set"
    echo "Please add this line to your shell startup file:"
    echo
    echo "export PIPENV_VENV_IN_PROJECT=1"
    exit 1;
fi

echo "Python OK"
echo "==============="
