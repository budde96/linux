# General stuff
export PS1="\u@\h:\w\\$ \[$(tput sgr0)\]"
alias ytdl='youtube-dl --ignore-errors --continue --no-overwrites --format 'bestvideo+bestaudio''
alias wttr='curl https://wttr.in/tallinn'
alias date='date +'%a %b %d %R %Y''
# Arch stuff
alias clearer='sudo pacman -Rs $(sudo pacman -Qqtd)'
alias updato='sudo pacman -Syu && yay -Syu'
# Update scripts
# Update Gentoo
alias updato='doas emaint -a sync && doas emerge --ask --verbose --update --deep --with-bdeps=y --newuse @world && doas emerge @module-rebuild && doas emerge --ask --depclean'
# Update Debian (and PiHole)
alias updato='sudo apt update && sudo apt -y full-upgrade && sudo apt -y autoremove (&& sudo pihole -up)'
# Update Alpine
alias updato='sudo apk update && sudo apk upgrade'
