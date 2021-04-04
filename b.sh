ln -sf /usr/share/zoneinfo/Asia/Kolkata /etc/localtime
hwclock --systohc

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

pacman -S pacman-contrib
cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup
rankmirrors -n 6 /etc/pacman.d/mirrorlist.backup > /etc/pacman.d/mirrorlist
