#!/bin/sh
mkswap /dev/sda7
swapon /dev/sda7
mkfs.ext4 /dev/sda6
mount /dev/sda6 /mnt
mkdir /mnt/home

curl -L https://raw.githubusercontent.com/fakeyatogod/archscript/main/b.sh > /mnt/b.sh

mount /dev/sda8 /mnt/home

pacstrap /mnt base linux linux-firmware
genfstab -U /mnt >> /mnt/etc/fstab

arch-chroot /mnt
