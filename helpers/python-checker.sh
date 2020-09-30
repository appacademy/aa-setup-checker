#!/bin/sh
. ./helpers/colors.sh
. ./helpers/utils.sh

STARTUP_FILE=$(shell_startup_file)
PYTHON3=$(which python3)
PYTHON=$(which python)
PYENV_IN_STARTUP_FILES=$(cat $STARTUP_FILE | grep -c "pyenv")
PYENV_GLOBAL=$(pyenv global)
PYENV_VERSION=$(pyenv --version)
IS_PYTHON_INSTALLED_IN_PYENV=$(pyenv versions | grep -c "3.8.5")
PYENV=$(echo $PYENV_VERSION | grep -c "pyenv")
PYTHON_VERSION=$(python3 --version | awk '{print $2}')
PYTHON_MAJOR_VERSION=$(echo $PYTHON_VERSION | cut -f 1 -d ".")
PYTHON_MINOR_VERSION=$(echo $PYTHON_VERSION | cut -f 2 -d ".")
IS_PYTHON_FROM_PYENV=$(echo $PYTHON | grep -c ".pyenv")
IS_PYTHON3_FROM_PYENV=$(echo $PYTHON3 | grep -c ".pyenv")
PIPENV=$(which pipenv)
PIPENV_VERSION=$(pipenv --version)
PYENV_LINES="export PATH=\"/Users/echo/.pyenv/bin:\$PATH\"\neval \"\$(pyenv init -)\"\neval \"\$(pyenv virtualenv-init -)\""

f_bold "Checking Python"
f_bold "==============="
echo "pyenv version: ${PYENV_VERSION}"
echo "Python Binary: ${PYTHON}"
echo "Python3 Binary: ${PYTHON3}"
echo "Python Version: ${PYTHON_VERSION}"
echo "pipenv Binary: ${PIPENV}"
echo "pipenv Version: ${PIPENV}"



if [ $PYENV_IN_STARTUP_FILES != 1 ]; then
    c_red "pyenv isn't installed or active"
    c_red "Please install it with this command"
    echo
    f_bold "curl https://pyenv.run | bash"
    echo
    c_red "Or you can make it active by adding these lines to your"
    c_red "shell startup file"
    echo
    f_bold $PYENV_LINES
    exit 1;
fi

if [ -z $PYTHON ] || [ -z $PYTHON3 ]; then
    c_red "Python3 is not installed"
    c_red "Please install Python 3.8"
    echo
    f_bold "pyenv install 3.8.5"
    exit 1;
fi

if [ $IS_PYTHON_INSTALLED_IN_PYENV != 1 ]; then
    c_red "You haven't got python 3.8.5 installed"
    c_red "using pyenv."
    c_red "Install it with this command"
    echo
    f_bold "pyenv install 3.8.5"
fi

if [ $PYENV_GLOBAL = 'system' ]; then
    c_red "You are still using the system python"
    c_red "Set the pyenv python to be the global"
    c_red "version with this command:"
    echo
    f_bold "pyenv global 3.8.5"
    exit 1;
fi

if [ $IS_PYTHON_FROM_PYENV != 1 ] || [ $IS_PYTHON3_FROM_PYENV != 1 ]; then
    c_red "Python wasn't installed with pyenv"
    c_red "Please install it with this command"
    echo
    f_bold "pyenv install 3.8.5"
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
    c_red "Please install pipenv with this command"\
    echo
    f_bold "pip install pipenv"
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
