#!/usr/bin/env bash
set -eu

source menu.sh
menu v2 v1 v2 v3
echo "You selected version $MENU_SELECTED."
