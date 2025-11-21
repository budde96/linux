if [[ $- != *i* ]] ; then
	return
fi
PATH="${PATH}:/home/anon/.local/bin"
export HISTSIZE=10
export HISTFILESIZE=10
alias ls='ls -ahl --color'
alias sudo='doas'
alias wttr='curl https://wttr.in/tallinn'
alias tsm='transmission-remote'
alias videodlp='yt-dlp -f "b" --embed-metadata'
alias fixprimary='xrandr --output DP-1 --primary'
alias convsvt='ffmpeg -i $VIDEO_FILE -c:v libsvtav1 -preset 0 -crf 20 -svtav1-params lp=4'
alias recompile='doas emerge -avuDN @world && doas emerge -ac && doas eclean-pkg && doas eclean-dist && doas eclean-kernel'
alias update='doas emerge --sync && doas emerge -avuDN @world && doas emerge -ac && doas eclean-pkg && doas eclean-dist && doas eclean-kernel && flatpak --user update && podman compose -f /opt/containers/podman-compose.yaml pull'
alias updatefull='doas emerge --sync && doas emerge -avuDN @world && doas emerge -ac && doas eclean-pkg && doas eclean-dist && doas eclean-kernel && doas /usr/local/bin/install-k3s.sh && sleep 10 && /usr/local/bin/update-pods.sh && flatpak --user update && flatpak --user uninstall --unused'
alias certupdate='doas certbot renew'
