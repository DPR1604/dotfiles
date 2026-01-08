#!/usr/bin/env bash

pushd ~/dotfiles
  git pull
  stow . 
popd

nm-applet --indicator &

dunst

wl-paste --type text --watch cliphist store &
wl-paste --type image --watch cliphist store &
