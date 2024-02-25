if [[ $- != *i* ]] ; then
	return
fi
alias sudo='doas'
alias wttr='curl https://wttr.in/tallinn'
alias videodlp='yt-dlp -f "b" --embed-metadata'
alias recompile='doas emerge --ask --verbose --update --deep --with-bdeps=y --newuse @world && doas emerge --ask --depclean && doas eclean-pkg && doas eclean-dist && doas eclean-kernel'
alias update='doas emerge --sync && doas emerge --ask --verbose --update --deep --with-bdeps=y --newuse @world && doas emerge --ask --depclean && doas eclean-pkg && doas eclean-dist && doas eclean-kernel'
