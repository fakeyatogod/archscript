sudo cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup

sudo awk '/^## India$/{f=1; next}f==0{next}/^$/{exit}{print substr($0, 1);}' /etc/pacman.d/mirrorlist.backup

sudo sed -i 's/^#Server/Server/' /etc/pacman.d/mirrorlist.backup

sudo rankmirrors -n 6 /etc/pacman.d/mirrorlist.backup > /etc/pacman.d/mirrorlist
