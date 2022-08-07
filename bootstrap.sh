#!/bin/bash
# Use this script to set up your environment for vim if you have never done this before.

set -ue

readonly PROGNAME=$(basename "$0")
readonly PROGDIR=$(readlink -m "$(dirname "$0")")

cd $PROGDIR
mkdir -p tmp/{backup,swap,undo}

rm -f ~/.vimrc # if it exists
ln -rs vimrc ../.vimrc
