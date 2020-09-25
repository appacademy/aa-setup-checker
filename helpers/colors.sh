NO_FORMAT="\033[0m"
C_GREEN="\033[38;5;10m"
C_RED="\033[38;5;196m"
F_BOLD="\033[1m"
C_WHITE="\033[38;5;15m"

c_red() {
  echo "${C_RED}${@}${NO_FORMAT}"
  return
}

c_green() {
  echo "${C_GREEN}${@}${NO_FORMAT}"
  return
}

f_bold() {
  echo "${F_BOLD}${C_WHITE}${@}${NO_FORMAT}"
  return
}
