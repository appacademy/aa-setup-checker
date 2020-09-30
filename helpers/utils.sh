. ./helpers/colors.sh

shell_startup_file() {
    if [ $SHELL = '/bin/bash' ]; then
        echo "$HOME/.bashrc"
    fi
    if [ $SHELL = '/bin/zsh' ]; then
        echo "$HOME/.zshrc"
    fi
}

shell_startup_file_message() {

    if [ $(shell_startup_file) = '~/.bashrc' ]; then
        echo "Your startup file is ~/.bashrc"
        echo "Use this command to edit it"
        echo
        f_bold "code ~/.bashrc"
    fi

    if [ $(shell_startup_file) = '~/.zshrc' ]; then
        echo "Your startup file is ~/.zshrc"
        echo "Use this command to edit it"
        echo
        f_bold "code ~/.zshrc"
    fi
}