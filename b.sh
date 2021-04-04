ln -sf /usr/share/zoneinfo/Asia/Kolkata /etc/localtime
hwclock --systohc

pacman -S nano

echo "en_US.UTF-8 UTF-8" > /etc/locale.gen

locale-gen

echo "LANG=en_US.UTF-8" > /etc/locale.conf

echo "yato" > /etc/hostname

echo "127.0.0.1	localhost
::1		localhost
127.0.1.1	yato.localdomain	yato" > /etc/hosts

echo "ENTER ROOT PASSWORD : "
passwd
useradd -m yato

echo "ENTER PASS FOR yato : "
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

pacman -S reflector
cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup
reflector --verbose --country India --sort rate --save /etc/pacman.d/mirrorlist

pacman -S xf86-video-intel mesa nvidia nvidia-utils
pacman -S xorg

pacman -S gnome gnome-extra firefox vlc git

systemctl enable gdm
