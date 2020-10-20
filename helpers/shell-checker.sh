source ./helpers/colors.sh
source ./helpers/utils.sh
hr
title "Checking Shell"
hr
c_green "Shell: $SHELL"
c_green "Shell Startup File: $(shell_startup_file)"
c_green "Running shell startup file..."
source $(shell_startup_file) > /dev/null 2>&1

