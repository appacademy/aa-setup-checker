source ./helpers/colors.sh

UBUNTU_VERSION=$(lsb_release -r -s)

hr
title "Checking Ubuntu"
hr
echo "Ubuntu Version: $UBUNTU_VERSION"

# Check shell
echo
$SHELL ./helpers/shell-checker.sh
if [ $? -eq 1 ]; then
  exit 1;
fi

# Check for Docker
echo
$SHELL ./helpers/node-checker.sh
if [ $? -eq 1 ]; then
    exit 1
fi
echo
$SHELL ./helpers/code-checker.sh
if [ $? -eq 1 ]; then
    exit 1
fi
echo
$SHELL ./helpers/python-checker.sh
if [ $? -eq 1 ]; then
    exit 1
fi
echo
$SHELL ./helpers/docker-checker.sh
if [ $? -eq 1 ]; then
    exit 1
fi


