IS_MACOS=$(uname -a | awk '{ print $1 }' | grep -c Darwin)
IS_WINDOWS=$(which cmd.exe | grep -c "cmd.exe")
IS_UBUNTU=$(lsb_release -s -i | grep -c "Ubuntu")

if [ $IS_MACOS = 1 ]; then
    sh ./macos-checker.sh
    if [ $? -eq 1 ]; then
        exit 1
    fi
    exit 0
fi

if [ $IS_WINDOWS = 1 ]; then
    sh ./windows-checker.sh
    if [ $? -eq 1 ]; then
        exit 1
    fi
    exit 0
fi

if [ $IS_UBUNTU = 1 ]; then
    sh ./ubuntu-checker.sh
    if [ $? -eq 1 ]; then
        exit 1
    fi
    exit 0
fi

echo "Unknown Operating System, checker script not supported"