#!/usr/bin/env bash

pushd ~/dotfiles
  git pull
  stow . 
popd

nm-applet --indicator &

waybar & 

dunst
