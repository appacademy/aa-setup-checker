source ./helpers/colors.sh
MACOS_VERSION=$(sw_vers -productVersion)
hr
title "Checking macOS"
hr
echo "macOS Version: $MACOS_VERSION"
$SHELL ./helpers/shell-checker.sh
if [ $? -eq 1 ];then
   exit 1
fi
$SHELL ./helpers/node-checker.sh
if [ $? -eq 1 ]; then
    exit 1
fi
$SHELL ./helpers/code-checker.sh
if [ $? -eq 1 ]; then
    exit 1
fi
# $SHELL ./helpers/python-checker.sh
# if [ $? -eq 1 ]; then
#     exit 1
# fi
$SHELL ./helpers/docker-checker.sh
if [ $? -eq 1 ]; then
    exit 1
fi
