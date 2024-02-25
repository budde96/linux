#!/bin/bash
export GTK_THEME=Adwaita:dark
[[ -f ~/.screenlayout/default.sh ]] && sh ~/.screenlayout/default.sh
while xsetroot -name "`date +'%a %b %d %R %Y'` CPU `top -bn 1 | awk 'FNR == 3 {print 100-$8}'`% Mem: `free -h --giga | awk 'FNR == 2 {print $3+$5}'`G Disk: `df -h | grep -e "466" | awk '{print $4}'`"
do
	sleep 3
done &
xwallpaper --output DisplayPort-1 --maximize Pictures/Wallpaper/peakpx.jpg &
xwallpaper --output HDMI-A-0 --maximize Pictures/Wallpaper/M8-Lagoon.png &
gentoo-pipewire-launcher &
exec dbus-launch --sh-syntax --exit-with-session dwm
