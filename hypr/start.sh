#!/usr/bin/env bash

swww init &

swww img ~/wallpapers/berries.jpg &

nm-applet --indicator &

waybar -c ~/.config/waybar/config.jsonrc & -s ~/.config/waybar/style.css &

dunst
