if [[ $- != *i* ]] ; then
	return
fi
PATH="${PATH}:/home/anon/.local/bin"
export HISTSIZE=10
export HISTFILESIZE=10
alias sudo='doas'
alias wttr='curl https://wttr.in/tallinn'
alias tsm='transmission-remote'
alias tsm-am='transmission-remote -w /mnt/3tb/Media/Movies -a'
alias tsm-at='transmission-remote -w /mnt/3tb/Media/TV -a'
alias videodlp='yt-dlp -f "b" --embed-metadata'
alias recompile='doas emerge -avuDN @world && doas emerge -ac && doas eclean-pkg && doas eclean-dist && doas eclean-kernel'
alias update='doas emerge --sync && doas emerge -avuDN @world && doas emerge -ac && doas eclean-pkg && doas eclean-dist && doas eclean-kernel'
