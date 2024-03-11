if [[ $- != *i* ]] ; then
	return
fi
alias sudo='doas'
alias wttr='curl https://wttr.in/tallinn'
alias videodlp='yt-dlp -f "b" --embed-metadata'
alias recompile='doas emerge -avuDN @world && doas emerge -ac && doas eclean-pkg && doas eclean-dist && doas eclean-kernel'
alias update='doas emerge --sync && doas emerge -avuDN @world && doas emerge -av && doas eclean-pkg && doas eclean-dist && doas eclean-kernel'
