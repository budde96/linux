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
cp ~/artix2.sh /mnt/root/
sync
artix-chroot /mnt /bin/bash -c "sh ~/artix2.sh"
umount -R /mnt
restart
