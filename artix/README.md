# Artix linux
## artix.sh
### Description
artix.sh should be used to quickly deploy an Artix Linux install with UEFI in mind. Currently this version is setup for VMs(qemu), for installation on baremetal some changes in the script is needed. \
No configuration is needed
Partitions are as follows: \
/dev/vda1 - vfat32 - /boot/efi - EFI partition \
/dev/vda2 - SWAP - SWAP - SWAP partition \
/dev/vda3 - ext4 - / - ROOT partition
### Usage
Download to /root and run as root user. \
chmod +x artix.sh \
./artix.sh
### WIP
1. SSH config \
2. Yay installation
