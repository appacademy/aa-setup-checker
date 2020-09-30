#!/bin/bash -l
NO_FORMAT="\033[0m"
C_GREEN="\033[38;5;10m"
C_CYAN="\033[36;5;10m"
C_RED="\033[38;5;196m"
F_BOLD="\033[1m"
C_WHITE="\033[38;5;15m"

hr() {
  s=$(printf "%-80s" "")
  f_bold "${s// /―}"
}

title() {
  c_cyan "${@}"
}

c_cyan() {
  printf "${C_CYAN}${@}${NO_FORMAT}\n"
}

c_red() {
  printf "${C_RED}${@}${NO_FORMAT}\n"
  return
}

c_green() {
  printf "${C_GREEN}${@}${NO_FORMAT}\n"
  return
}

f_bold() {
  printf "${F_BOLD}${C_WHITE}${@}${NO_FORMAT}\n"
  return
}
