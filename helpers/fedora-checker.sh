source ./helpers/colors.sh

FEDORA_VERSION=$(cat /etc/fedora-release)

hr
title "Checking Fedora"
hr
echo "Debian Version: $FEDORA_VERSION"

# Check Linux
echo
$SHELL ./helpers/linux-checker.sh
if [ $? -eq 1 ]; then
  exit 1;
fi
