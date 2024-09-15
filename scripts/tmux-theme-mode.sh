#!/usr/bin/env bash
# This script will reload tmux when the theme changes

set -o errexit
set -o pipefail
[[ "${TRACE-0}" =~ ^1|t|y|true|yes$ ]] && set -o xtrace

SCRIPT_NAME=${0##*/}
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
cd "$SCRIPT_DIR"

OPTION_THEME_LIGHT="@dark-notify-theme-path-light"
OPTION_THEME_DARK="@dark-notify-theme-path-dark"

IFS= read -rd '' USAGE <<EOF || :
Set tmux dark/light mode.
Usage: $ ${SCRIPT_NAME} light|dark
EOF

tmux source $HOME/.tmux.conf
