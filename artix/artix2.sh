#!/bin/bash
ln -sf /usr/share/zoneinfo/Europe/Tallinn /etc/localtime
hwclock --systohc
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
echo "en_US ISO-8859-1" >> /etc/locale.gen
locale-gen
pacman -S grub os-prober efibootmgr
grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=grub
grub-mkconfig -o /boot/grub/grub.cfg
echo "Enter new root password:"
passwd
echo "test" >> /etc/hostname
echo "127.0.0.1	localhost" >> /etc/hosts
echo "::1	localhost" >> /etc/hosts
echo "10.0.200.20	test.localdomain test" >> /etc/hosts
pacman -S connman-runit
ln -s /etc/runit/sv/connmand /etc/runit/runsvdir/default
echo "KEYMAP=sv-latin1" >> /etc/vconsole.conf
mkinitcpio -P
useradd -m anon
usermod -aG video,audio,input,power,storage,optical,lp,scanner,dbus,uucp anon
echo "Enter password for new user:"
passwd anon
echo "anon	ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
echo "[lib32]" >> /etc/pacman.conf
echo "Include = /etc/pacman.d/mirrorlist" >> /etc/pacman.conf
pacman -S vim wget git htop neofetch openssh-runit artix-archlinux-support lib32-artix-archlinux-support go
rm -rf /etc/runit/runsvdir/default/agetty-tty*
ln -s /etc/runit/sv/agetty-tty1 /etc/runit/runsvdir/default
NET_CARD=$(connmanctl services|grep -o "ethernet\w*cable")
connmanctl config $NET_CARD --ipv4 manual 10.0.200.20 255.255.0.0 10.0.0.1
connmanctl config $NET_CARD --nameservers 10.0.0.20 10.0.0.21
ln -s /etc/runit/sv/sshd /etc/runit/runsvdir/default
pacman -Syyu
echo "Port 22" >> /etc/ssh/sshd_config
echo "AddressFamily inet" >> /etc/ssh/sshd_config
echo "PermitRootLogin no" >> /etc/ssh/sshd_config
# WIP YaY
cd /opt
git clone https://aur.archlinux.org/yay.git
chown -R anon:anon ./yay
runuser -l anon -c 'cd /opt/yay && makepkg si'
runuser -l anon -c 'yay -Syyu'
cd
echo "root	ALL=(ALL) ALL" > /etc/sudoers
echo "anon	ALL=(ALL) ALL" >> /etc/sudoers
sync
exit
