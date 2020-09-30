#!/bin/bash -l

source ./helpers/colors.sh
source ./helpers/utils.sh
hr
f_bold "Checking Shell"
hr
c_green "Shell: $SHELL"
c_green "Shell Startup File: $(shell_startup_file)"
