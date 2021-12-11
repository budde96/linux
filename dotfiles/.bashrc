# Update scripts
# Update Arch
alias updato='sudo pacman -Syyu && yay -Syyu'
# Update Debian (and PiHole)
alias updato='sudo apt update && sudo apt -y full-upgrade && sudo apt -y autoremove (&& sudo pihole -up)'
# Update Alpine
alias updato='sudo apk update && sudo apk upgrade'
# Update Gentoo
alias updato='doas emaint -a sync && doas emerge --ask --verbose --update --deep --newuse @world && doas emerge @module-rebuild && doas emerge --ask --depclean'
