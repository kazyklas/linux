#!/bin/bash
#############################
# Creator: Tomas Klas
# Date: 2019-03-01
# Contact: tomas.klas@datamole.cz
#############################

printf -n "Checking internet connection.."
if ! ping -c 2 8.8.8.8; then
		  printf -n "No connection to the internet.."
		  printf -n "Aborting installation"
		  exit 1
fi

echo "Installing stuff that Tomik needs"
sudo pacman -Suy python3 pip3 htop ansible fish 

if [ ! "$SHELL" = "/usr/bin/fish" ];then 
    echo "Change default shell to fish"
    sudo usermod --shell /usr/bin/fish tklas
fi


printf -n "Updating system.."
sudo pacman -Syyu

if [ ! -d ~/Software ]; then
		  mkdir ~/Software
fi

cd ~/Software

if ! git --version; then 
		  printf -n "Installing git"
		  sudo pacman -Sy git
fi

git_repositories=$( cat git-to-clone )

for i in $git_repositories; do
		  git clone "$i"
		  cd $( ls -Art | tail -1 )
		  makepkg -s --install --noconnfirm
		  cd ..
done

