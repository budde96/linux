#!/bin/bash
loadkeys sv-latin1
cfdisk -z /dev/vda
mkfs.vfat -F32 /dev/vda1
fatlabel /dev/vda1 BOOT
mkswap -L SWAP /dev/vda2
swapon /dev/vda2
mkfs.ext4 -L ROOT /dev/vda3
mount /dev/vda3 /mnt
mkdir -p /mnt/boot
mkdir -p /mnt/boot/efi
mount /dev/vda1 /mnt/boot/efi
basestrap /mnt base base-devel runit elogind-runit
basestrap /mnt linux linux-firmware
fstabgen -U /mnt >> /mnt/etc/fstab
cat > artix2.sh <<EOF
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
echo "test" > /etc/hostname
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
echo "[lib32]" >> /etc/pacman.conf
echo "Include = /etc/pacman.d/mirrorlist" >> /etc/pacman.conf
pacman -Syyu
pacman -S vim wget curl git btop neofetch openssh-runit artix-archlinux-support lib32-artix-archlinux-support
rm -rf /etc/runit/runsvdir/default/agetty-tty*
ln -s /etc/runit/sv/agetty-tty1 /etc/runit/runsvdir/default
NET_CARD=$(connmanctl services|grep -o "ethernet\w*cable")
connmanctl config $NET_CARD --ipv4 manual 10.0.200.20 255.255.0.0 10.0.0.1
connmanctl config $NET_CARD --nameservers 10.0.0.20 10.0.0.21
ln -s /etc/runit/sv/sshd /etc/runit/runsvdir/default
echo "Port 22" >> /etc/ssh/sshd_config
echo "AddressFamily inet" >> /etc/ssh/sshd_config
echo "PermitRootLogin no" >> /etc/ssh/sshd_config
echo "anon	ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
cd /opt
git clone https://aur.archlinux.org/yay.git
chown -R anon:anon ./yay
cd
runuser -l anon -c 'cd /opt/yay && makepkg -si'
runuser -l anon -c 'yay -Syyu'
echo "root	ALL=(ALL) ALL" > /etc/sudoers
echo "anon	ALL=(ALL) ALL" >> /etc/sudoers
sync
exit
EOF
chmod +x artix2.sh
cp ~/artix2.sh /mnt/root/
sync
artix-chroot /mnt /bin/bash -c "sh ~/artix2.sh"
umount -R /mnt
reboot
