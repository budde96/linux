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
alias convsvt='ffmpeg -i $VIDEO_FILE -c:v libsvtav1 -preset 0 -crf 20 -svtav1-params lp=4'
alias recompile='doas emerge -avuDN @world && doas emerge -ac && doas eclean-pkg && doas eclean-dist && doas eclean-kernel'
alias update='doas emerge --sync && doas emerge -avuDN @world && doas emerge -ac && doas eclean-pkg && doas eclean-dist && doas eclean-kernel && flatpak --user update && podman compose -f /opt/containers/podman-compose.yaml pull'
alias certupdate='doas certbot certonly --rsa-key-size 4096 --standalone -d example.com'
alias fixpihole='podman exec pihole apt remove -y lighttpd php-common php-cgi php-sqlite3 php-xml php-intl php-json  lighttpd-mod-openssl && podman exec pihole service lighttpd stop && podman exec pihole rm -rf /etc/s6-overlay/s6-rc.d/lighttpd* && podman exec pihole kill -9 250 251 252 253 254 269 270 271 272'
