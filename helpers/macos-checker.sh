source ./helpers/colors.sh
MACOS_VERSION=$(sw_vers -productVersion)
CURRENT_ARCH=$(uname -m)
IS_ROSETTA="$(sysctl -in sysctl.proc_translated)"

hr
title "Checking macOS"
hr
echo "macOS Version: $MACOS_VERSION"
echo "Current Architecture: $CURRENT_ARCH"

if [ $IS_ROSETTA = "1" ]; then
c_yellow "Warning: You are running under a Rosetta Termninal,"
c_yellow "you should switch back to the native terminal if possible"
fi

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
$SHELL ./helpers/python-checker.sh
if [ $? -eq 1 ]; then
    exit 1
fi
$SHELL ./helpers/docker-checker.sh
if [ $? -eq 1 ]; then
    exit 1
fi
