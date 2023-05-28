#!/bin/bash

username=neo
pass=1811

#setfont cyr-sun16
setfont cyr-sun16
#xorg
sudo pacman -S xorg-server --noconfirm
#timezone
sudo timedatectl set-timezone Asia/Krasnoyarsk
#nvidia
sudo pacman -S nvidia-dkms nvidia-utils opencl-nvidia nvidia-settings lib32-opencl-nvidia lib32-nvidia-utils --noconfirm
#pipewire
sudo pacman -S pipewire lib32-pipewire wireplumber pipewire-alsa pipewire-pulse pipewire-jack lib32-pipewire-jack --noconfirm
#KDE and apps
sudo pacman -S plasma plasma-desktop --noconfirm
#KDE and apps
sudo pacman -S dolphin dolphin-plugins konsole kdenlive gwenview elisa mpv kcalc kcalendarcore kdeconnect plasma-wayland-session kwalletmanager libva-utils vdpauinfo vulkan-icd-loader lib32-vulkan-icd-loader vulkan-headers vulkan-validation-layers vulkan-tools qt-gstreamer kdenetwork-filesharing spectacle --noconfirm
#apps
sudo pacman -S firefox gparted engrampa caja p7zip unace brotli rpm-tools cpio latte-dock steam steam-native-runtime obs-studio cuda blender krita qbittorrent telegram-desktop gnome-disk-utility cpupower bash icoutils wget bubblewrap zstd cabextract bc tar openssl gamemode desktop-file-utils curl dbus freetype2 gdk-pixbuf2 ttf-font zenity lsb-release nss xorg-xrandr vulkan-driver lsof lib32-freetype2 lib32-libgl lib32-gcc-libs lib32-libx11 lib32-libxss lib32-alsa-plugins lib32-libgpg-error lib32-nss lib32-vulkan-driver lib32-gamemode lib32-openssl meson gst-libav gst-plugins-bad gst-plugins-base gst-plugins-good gst-plugins-ugly ffnvcodec-headers samba cifs-utils extra-cmake-modules plasma-framework gst-libav base-devel mpv python-websockets qt5-declarative qt5-websockets qt5-webchannel cmake ntfs-3g --noconfirm
#sddm
sudo pacman -S sddm --noconfirm
#bluetooth
sudo pacman -S bluez bluez-utils --noconfirm
#services
sudo systemctl enable sddm
#services
sudo systemctl enable bluetooth
#setting cpupower
sudo cpupower frequency-set -g performance
#services
sudo systemctl enable cpupower
#pikaur
git clone https://aur.archlinux.org/pikaur.git
#pikaur
cd pikaur
#pikaur
makepkg -fsri --noconfirm
#cd
cd
#aur apps
pikaur -S pamac-aur stacer-bin fastfetch timeshift timeshift-autosnap protonup-qt-bin google-chrome yandex-browser speech-dispatcher ttf-font gstreamer-meta ventoy-bin onlyoffice-bin xow-git libva-nvidia-driver-git --noconfirm
#services
sudo systemctl enable xow
#zsh
curl -L https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
#zsh chsh
( 
     echo $pass 
 ) |chsh -s /usr/bin/zsh
#zsh chsh root
sudo chsh -s /usr/bin/zsh
#zsh open
zsh
#zsh
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
#zsh
mv zsh-syntax-highlighting .zsh-syntax-highlighting
#zsh
echo "source ~/.zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc
#zsh
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
#zsh
sudo sed 's/(#export PATH=#HOME/bin:usr/local/bin:$PATH)/(export PATH=#HOME/bin:usr/local/bin:$PATH)/g' /.zshrc
#zsh
sudo sed 's/plugins =(git)/plugins =(git zsh-autosuggestions sudo)/g' /.zshrc
#zsh
source .zshrc
#portproton
wget -c "https://github.com/Castro-Fidel/PortWINE/raw/master/portwine_install_script/PortProton_1.0" && sh PortProton_1.0 -rus
#mkinitcpio.conf
sudo sed 's/MODULES=()/MODULES=(nvidia nvidia_modeset nvidia_uvm nvidia_drm btrfs)/g' -i /etc/mkinitcpio.conf
#root
( 
     echo $pass 
     echo $pass 
 ) |su
#enviroment
echo 'NVD_BACKEND=direct' >> /etc/enviroment
#enviroment
echo 'MOZ_DISABLE_RDD_SANDBOX=1' >> /etc/enviroment
#enviroment
echo 'LIBVA_DRIVER_NAME=nvidia' >> /etc/enviroment
#enviroment
echo 'EDITOR=micro' >> /etc/enviroment
#enviroment
echo 'EGL_PLATFORM=wayland' >> /etc/enviroment
#enviroment
echo 'MOZ_ENABLE_WAYLAND=1 firefox' >> /etc/enviroment
#samba
echo '[global]' >> /etc/samba/smb.conf
#samba
echo 'usershare path = /var/lib/samba/usershares' >> /etc/samba/smb.conf
#samba
echo 'usershare max shares = 100' >> /etc/samba/smb.conf
#samba
echo 'usershare allow guests = yes' >> /etc/samba/smb.conf
#samba
echo 'usershare owner only = yes' >> /etc/samba/smb.conf
#samba
( 
     echo $pass 
     echo $pass 
 ) | smbpasswd -a $username
#samba
usermod -g users -G wheel,video $username
#samba
mkdir /var/lib/samba/usershares
#samba
chown root:users /var/lib/samba/usershares
#samba
chmod 1770 /var/lib/samba/usershares
#samba
gpasswd users -a $username
#samba
systemctl enable smb
#samba
systemctl enable nmb
#mkinitcpio
sudo mkinitcpio -P
#exit
exit
