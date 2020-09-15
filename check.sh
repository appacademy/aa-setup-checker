IS_MACOS=$(uname -a | awk '{ print $1 }' | grep -c Darwin)
IS_WINDOWS=$(which cmd.exe | grep -c "cmd.exe")
LSB_RELEASE=$(which lsb_release)
if [ -n $LSB_RELEASE ]; then
    IS_UBUNTU=$(lsb_release -s -i | grep -c "Ubuntu")
fi

if [ $IS_MACOS = 1 ]; then
    sh ./helpers/macos-checker.sh
    if [ $? -eq 1 ]; then
        exit 1
    fi
    exit 0
fi

if [ $IS_WINDOWS = 1 ]; then
    sh ./helpers/windows-checker.sh
    if [ $? -eq 1 ]; then
        exit 1
    fi
    exit 0
fi

if [ $IS_UBUNTU = 1 ]; then
    sh ./helpers/ubuntu-checker.sh
    if [ $? -eq 1 ]; then
        exit 1
    fi
    exit 0
fi

echo "Unknown Operating System, checker script not supported"
