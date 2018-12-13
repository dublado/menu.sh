#!/usr/bin/env bash

MENU_INDEX=0
MENU_ACTIVE=""
MENU_OPTIONS=()

MENU_COLOR_OPTIONS=${MENU_COLOR_OPTIONS:-2}
MENU_COLOR_ACTIVE=${MENU_COLOR_ACTIVE:-0}
MENU_COLOR_ARROW=${MENU_COLOR_ARROW:-36}

menu.show() {
  local counter=0
  for i in "${MENU_OPTIONS[@]}"
  do
    if [ "$i" = "$MENU_SELECTED" ]
    then
      MENU_INDEX=$counter
      printf "\033[%sm>\033[0m \033[%sm%s\033[0m\n" $MENU_COLOR_ARROW $MENU_COLOR_ACTIVE "${i}"
    else
      printf "  \e[2m${i}\e[22m\n"
    fi
    counter=$((counter + 1))
  done
}

menu.choose() {
  local index=$1
  local count="${#MENU_OPTIONS[@]}"
  if [ "$index" -ge "$count" ]
  then
    index=$((count - 1))
  elif [ "$index" -lt "0" ]
  then
    index=0
  fi

  echo -e "\033[$((count + 1))A"
  MENU_SELECTED="${MENU_OPTIONS[index]}"
  menu.show
}

menu() {
  MENU_INDEX=0
  MENU_SELECTED=${1:-}
  MENU_OPTIONS=(${@:2})

  ESCAPE_SEQ=$'\033'
  ARROW_UP=$'A'
  ARROW_DOWN=$'B'

  menu.show
  while true
  do
    read -rsn 1 key1
    case "$key1" in
      $ESCAPE_SEQ)
        read -rsn 1 -t 1 key2
        if [[ "$key2" == "[" ]]
        then
          read -rsn 1 -t 1 key3
          case "$key3" in
            $ARROW_UP)    menu.choose $((MENU_INDEX - 1)) ;;
            $ARROW_DOWN)  menu.choose $((MENU_INDEX + 1)) ;;
          esac
        fi
        ;;
   
      "q")    unset MENU_SELECTED;  return ;;
      "")     export MENU_SELECTED; return ;;
    esac
  done
}
