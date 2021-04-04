mkswap /dev/sda7
swapon /dev/sda7
mkfs.ext4 /dev/sda6

mount /dev/sda6 /mnt
pacstrap /mnt base linux linux-firmware
genfstab -U /mnt >> /mnt/etc/fstab

arch-chroot /mnt
ln -sf /usr/share/zoneinfo/Asia/Kolkata /etc/localtime

pacman -S nano
nano /etc/locale.gen
locale-gen
nano /etc/hostname
nano /etc/hosts

passwd
useradd -m yato
passwd yato
usermod -aG wheel,audio,video,optical,storage yato

pacman -S sudo
EDITOR=nano visudo

pacman -S grub intel-ucode
pacman -S  efibootmgr dosfstools os-prober mtools
mkdir /boot/EFI
mount /dev/sda1 /boot/EFI
grub-install --target=x86_64-efi  --bootloader-id=grub_uefi --recheck
grub-mkconfig -o /boot/grub/grub.cfg

pacman -S networkmanager
systemctl enable NetworkManager
