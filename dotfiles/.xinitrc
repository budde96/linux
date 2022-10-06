#!/bin/bash
# GTK dark theme
export GTK_THEME=Adwaita:dark
# Load .Xmodmap
#[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap
# Load screen settings
[[ -f ~/.screenlayout/default.sh ]] && sh ~/.screenlayout/default.sh
# Wallpaper
[[ -f ~/your/wallpaper.png ]] && xwallpaper --zoom ~/your/wallpaper.png
# start dwm, shows a clock, shows current CPU usage and / disk free space
while xsetroot -name "`date +'%a %b %d %R %Y'` CPU `top -bn 1 | head | awk 'FNR == 3 {print 100-$8}'`% Disk: `df -h | grep -e "102G" | awk '{ print $4 }'`"
do
    sleep 3
done &
exec dwm
