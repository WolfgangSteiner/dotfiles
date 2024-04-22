#! /usr/bin/zsh

header() {
  separator
  #echo -n "# "
  echo $1
  separator
}

separator() {
  local sep=${1:-=}
  printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' $sep
}

get_cwd() {
    local cwd="${PWD/#$HOME/~}"  # Replace $HOME with ~
    echo "$cwd"
}

#get_cwd
jj st --color always | grep -vE "(Working|Parent)" 
echo
jj log --color always
