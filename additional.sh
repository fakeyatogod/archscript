git clone https://aur.archlinux.org/paru.git tempparu
cd tempparu
makepkg -si
cd ..
rm -rf tempparu

paru -S google-chrome ttf-google-fonts-git noto-fonts-cjk

curl -L https://raw.githubusercontent.com/akhilnarang/scripts/master/setup/arch-manjaro.sh > arch-manjaro.sh 

chmod +x arch-manjaro.sh

./arch-manjaro.sh

rm arch-manjaro.sh
