#!/usr/bin/env sh

#Start swww
WALLPAPERS_DIR=~/wallpapers
CURRENT=$WALLPAPERS_DIR/current
WALLPAPER=$(find $WALLPAPERS_DIR -type f | shuf -n 1)

ln -sfn $WALLPAPER $CURRENT
swww img "$CURRENT"
