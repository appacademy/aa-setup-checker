source ./helpers/colors.sh

RASPBIAN_VERSION=$(lsb_release -r -s)

hr
title "Checking Raspbian"
hr
echo "Raspbian Version: $RASPBIAN_VERSION"

# Check Linux
echo
$SHELL ./helpers/linux-checker.sh
if [ $? -eq 1 ]; then
  exit 1;
fi
