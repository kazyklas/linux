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

printf -n "Updating system.."
sudo pacman -Syyu

if [ ! -d ~/software ]; then
		  mkdir ~/software
fi

cd ~/software

if ! git --version; then 
		  printf -n "Installing git"
		  sudo pacman -S git
fi

git_repositories=$( cat git-to-clone )

for i in $git_repositories; do
		  git clone "$i"
		  cd $( ls -Art | tail -1 )
		  makepkg -s --install --noconnfirm
		  cd ..
done

