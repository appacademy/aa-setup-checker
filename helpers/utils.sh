. ./helpers/colors.sh

shell_startup_file() {
    if [ $SHELL = '/bin/bash' ]; then
        echo "Your startup file is ~/.bashrc"
        echo "Use this command to edit it"
        echo
        f_bold "code ~/.bashrc"
    fi

    if [ $SHELL = '/bin/zsh' ]; then
        echo "Your startup file is ~/.zshrc"
        echo "Use this command to edit it"
        echo
        f_bold "code ~/.zshrc"
    fi
}