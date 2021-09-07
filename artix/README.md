# Artix linux
## artix.sh
### Description
artix.sh should be used to quickly deploy an Artix Linux install with UEFI in mind. Currently this version is setup for VMs(qemu), for installation on baremetal some changes in the script is needed. \
No configuration is needed \
SSH will be configured for only IPv4 and won't allow root login. \
Yay will be installed and 32-bit libraries are enabled. \
\
Partitions are as follows: \
/dev/vda1 - vfat32 - /boot/efi - EFI partition \
/dev/vda2 - SWAP - SWAP - SWAP partition \
/dev/vda3 - ext4 - / - ROOT partition
### Usage
Download to /root and run as root user: \
curl -o artix.sh https://raw.githubusercontent.com/BuddeSwe/linux/main/artix/artix.sh \
chmod +x artix.sh \
./artix.sh
