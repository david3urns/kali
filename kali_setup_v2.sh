#!/bin/bash
#my kali linux customization script used to install packages and add aliases

#david3urns@gmail.com

#a simple script to configure and install additional packages for kali linux
#run this script with sudo privileges

#PLEASE keep in mind that this is my own personal script. I find these packages
#to be interesting or helpful. If you have any recommendations please let me
#know!

#Also keep in mind that this is my first publicly released script. If you find
#any errors please let me know ASAP so that I may fix them.

#begin install banner function, which generates a banner to let the user know
#what package/feature is being installed
banner_function(){
  HARD_LINE="========================================"
  COLUMNS=$( tput cols )
  Y=$((($COLUMNS-${#HARD_LINE})/2))
  X=0
  tput clear
  tput bold
  tput cup $X $Y
  echo "${HARD_LINE}"
  echo ""
  Y=$((($COLUMNS-${#1})/2))
  X=1
  tput cup $X $Y
  echo "$1"
  echo ""
  Y=$((($COLUMNS-${#HARD_LINE})/2))
  X=2
  tput cup $X $Y
  echo "${HARD_LINE}"
  tput sgr0
  echo ""
}


#This part of the script offers to update the users installation of kali linux
banner_function Update\ Kali
echo -n "Would you like to update your packages and OS? (Recommended) (y/n) "
read RESPONSE
if [ $RESPONSE == n ] || [ $RESPONSE == N ]; then
  echo "Your OS and current packages will not be updated."
elif [ $RESPONSE == y ] || [ $RESPONSE == Y ]; then
  echo "Updating your OS and installed packages, please wait."
  apt update && apt upgrade
fi
echo ""
sleep 2


#Next we're going to install additional programs to allow for additional cusomization of the environment
#and more functionality


#Neofetch (System and OS info splash on the terminal window)
banner_function Neofetch
echo -n "Would you like to install Neofetch? (y/n) "
read RESPONSE
if [ $RESPONSE == n ] || [ $RESPONSE == N ]; then
  echo "Neofetch will not be installed, moving to the next package."
elif [[ ! -x "$(command -v neofetch)" && ($RESPONSE = y || $RESPONSE = Y) ]]; then
  echo "Neofetch is not installed on your system, installing now."
  apt install neofetch -y
  #nested elif statement to add neofetch to bashrc, causing neofetch to run
  #every time the terminal opens
  echo "Would you like Neofetch to run every time you open the terminal? (y/n) "
  read RESPONSE1
  if [ $RESPONSE1 == n ] || [ $RESPONSE1 == N ]; then
    echo "Neofetch is installed but will not run when the terminal launches."
  elif [ $RESPONSE1 == y ] || [ $RESPONSE1 == Y ]; then
    echo "Neofetch will be run every time you launch the terminal."
    echo "neofetch" >> /home/kali/.bashrc
    sleep 1
  fi
elif [[ -x "$(command -v neofetch)" && ($RESPONSE = y || $RESPONSE = Y) ]]; then
  echo "Neofetch is already installed, skipping."
fi
echo ""
sleep 2

#tmux (terminal multiplexer)
banner_function TMUX
echo -n "Would you like to install TMUX? (y/n) "
read RESPONSE
if [ $RESPONSE == n ] || [ $RESPONSE == N ]; then
  echo "TMUX will not be installed, moving to the next package."
elif [[ ! -x "$(command -v tmux)" && ($RESPONSE = y || $RESPONSE = Y) ]]; then
  echo "TMUX is not installed on your system, installing now."
  apt install tmux -y
elif [[ -x "$(command -v tmux)" && ($RESPONSE = y || $RESPONSE == Y) ]]; then
  echo "Tmux is already installed, skipping."
fi
echo ""
sleep 2

#rtorrent (a torrent client)
banner_function Rtorrent
echo -n "Would you like to install rtorrent? (y/n) "
read RESPONSE
if [ $RESPONSE == n ] || [ $RESPONSE == N ]; then
  echo "Rtorrent will not be installed, moving to the next package."
elif [[ ! -x "$(command -v rtorrent)" && ($RESPONSE = y || $RESPONSE = Y) ]]; then
  echo "Rtorrent is not installed on your system, installing now."
  apt install rtorrent -y
elif [[ -x "$(command -v rtorrent)" && ($RESPONSE = y || $RESPONSE = Y) ]]; then
  echo "Rtorrent is already installed, skipping."
fi
echo ""
sleep 2

#git (a utility to pull repositories from github)
banner_function GIT
echo -n "Would you like to install Git? (y/n) "
read RESPONSE
if [ $RESPONSE == n ] || [ $RESPONSE == N ]; then
  echo "Git will not be installed, moving to the next package."
elif [[ ! -x "$(command -v git)" && ($RESPONSE = y || $RESPONSE = Y) ]]; then
  echo "Git is not installed on your system, installing git now..."
  apt install git -y
elif [[ -x "$(command -v git)" && ($RESPONSE = y || $RESPONSE = Y) ]]; then
  echo "Git is already installed, skipping."
fi
echo ""
sleep 2

#dkms (dynamic kernel module support)
banner_function DKMS
echo -n "Would you like to install DKMS? (y/n) "
read RESPONSE
if [ $RESPONSE == n ] || [ $RESPONSE == N ]; then
  echo "DMKS will not be installed, moving to the next package."
elif [[ ! -x "$(command -v dkms)" && ($RESPONSE = y || $RESPONSE = Y) ]]; then
  echo "DMKS is not installed on your system, installing now."
  apt install dkms -y
elif [[ -x "$(command -v dkms)" && ($RESPONSE = y || $RESPONSE = Y) ]]; then
  echo "DKMS is already installed on your system, skipping."
fi
echo ""
sleep 2

#gotop (system monitoring utility based on top)
banner_function Gotop
echo -n "Would you like to install Gotop? (y/n) "
read RESPONSE
if [ $RESPONSE == n ] || [ $RESPONSE == N ]; then
  echo "Gotop will not be installed, moving to the next package."
elif [[ ! -x "$(command -v gotop)" && ($RESPONSE = y || $RESPONSE = Y) ]]; then
  echo "Gotop is not installed on your system, installing now."
  apt install gotop -y
elif [[ -x "$(command -v gotop)" && ($RESPONSE = y || $RESPONSE = Y) ]]; then
  echo "Gotop is already installed on your system, skipping."
fi
echo ""
sleep 2

#cmatrix (terminal matrix emulator)
banner_function Cmatrix
echo -n "Would you like to install cmatrix? (y/n) "
read RESPONSE
if [ $RESPONSE == n ] || [ $RESPONSE == N ]; then
  echo "Cmatrix will not be installed, moving to the next package."
elif [[ ! -x "$(command -v cmatrix)" && ($RESPONSE = y || $RESPONSE = Y) ]]; then
  echo "Cmatrix is not installed on your system, installing now."
  apt install cmatrix -y
elif [[ -x "$(command -v cmatrix)" && ($RESPONSE = y || $RESPONSE = Y) ]]; then
  echo "Cmatrix is already installed on your system, skipping."
fi
echo ""
sleep 2

#slurm (network interface monitoring tool for the terminal)
banner_function Slurm
echo -n "Would you like to install slurm on your system? (y/n) "
read RESPONSE
if [ $RESPONSE == n ] || [ $RESPONSE == N ]; then
  echo "Slurm will not be installed, moving to the next package."
elif [[ ! -x "$(command -v slurm)" && ($RESPONSE = y || $RESPONSE = Y) ]]; then
  echo "Slurm is not installed on your system, installing now."
  apt install slurm -y
elif [[ -x "$(command -v slurm)" && ($RESPONSE = y || $RESPONSE = Y) ]]; then
  echo "Slurm is already installed on your system, skipping."
fi
echo ""
sleep 2

#flameshot (screenshot utility)
banner_function Flameshot
echo -n "Would you like to install flameshot on your system? (y/n) "
read RESPONSE
if [ $RESPONSE == n ] || [ $RESPONSE == N ]; then
  echo "Flameshot will not be installed, moving to the next package."
elif [[ ! -x "$(command -v flameshot)" && ($RESPONSE = y || $RESPONSE = Y) ]]; then
  echo "Flameshot is not currently installed on your system, installing now."
  apt install flameshot -y
elif [[ -x "$(command -v flameshot)" && ($RESPONSE = y || $RESPONSE = Y) ]]; then
  echo "Flameshot is already installed on your system, skipping."
fi
echo ""
sleep 2

#now we're going into the downloads directory to store all the git Downloads
cd /home/kali/Downloads

#check to see if anonsurf is installed, and if not, download it
banner_function Anonsurf
echo -n "Would you like to install anonsurf on your system? (y/n) "
read RESPONSE
if [ $RESPONSE == n ] || [ $RESPONSE == N ]; then
  echo "Anonsurf will not be installed, moving to the next package."
elif [[ ! -x "$(command -v anonsurf)" && ($RESPONSE = y || $RESPONSE = Y) ]]; then
  echo "Anonsurf is not currently installed on your system, installing now."
  cd /home/kali/Downloads/
  git clone https://github.com/Und3rf10w/kali-anonsurf.git
  cd kali-anonsurf
  ./installer.sh
  cd ..
elif [[ -x "$(command -v anonsurf)" && ($RESPONSE = y || $RESPONSE = Y) ]]; then
    echo "Anonsurf has already been installed, skipping."
fi
echo ""
sleep 2

#check to see if spiderfoot is installed, and if not, download and install it
banner_function Spiderfoot
echo "Please wait, searching for existing sf.py on your system."
file_search=$(find / -type f -name sf.py 2>&1 | grep sf.py)
echo -n "Would you like to install Spiderfoot? (y/n) "
read RESPONSE
if [ $RESPONSE == n ] || [ $RESPONSE == N ]; then
  echo "Spiderfoot will not be installed, moving to the next package."
elif [[ -z $file_search && ($RESPONSE = y || $RESPONSE = Y) ]]; then
  echo "Spiderfoot is not currently installed, installing now."
  cd /usr/share/
  git clone https://github.com/smicallef/spiderfoot.git
#create an alias for spiderfoot in .bash_aliases
  echo ""
  echo "alias sf='python3 /usr/share/spiderfoot/sf.py'" >> ~/.bash_aliases
  echo "An alias has been created for spiderfoot in ~/.bash_aliases"
  echo "Use sf at the command prompt to launch spiderfoot."
  sleep 5
elif [[ -n $file_search && ($RESPONSE = y || $RESPONSE = Y) ]]; then
  echo "Spiderfoot has already been installed, skipping."
fi
echo ""
sleep 2

#check to see if pip is installed, and if not, download and install it
banner_function Pip
echo -n "Would you like to install Pip? (y/n) "
read RESPONSE
if [ $RESPONSE == n ] || [ $RESPONSE == N ]; then
  echo "Pip will not be installed, moving to the next package."
elif [[ (! -x "$(command -v pip)" || ! -x "$(command -v pip3)") && ($RESPONSE = y || $RESPONSE = Y) ]]; then
  echo "Pip is not currently installed, installing now."
  mkdir /usr/share/pip && cd /usr/share/pip
  curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
  python3 get-pip.py
elif [[ ( -x "$(command -v pip)" || -x "$(command -v pip3)") && ($RESPONSE = y || $RESPONSE = Y) ]]; then
  echo "Pip is already installed, skipping."
fi
echo ""
sleep 2

#xerosploit
banner_function Xerosploit
echo -n "Would you like to install Xerosploit? (y/n) "
read RESPONSE
if [ $RESPONSE == n ] || [ $RESPONSE == N ]; then
  echo "Xerosploit will not be installed, moving to the next package."
elif [[ ! -x "$(command -v xerosploit)" && ($RESPONSE = y || $RESPONSE = Y) ]]; then
  echo "Xerosploit is not currently installed, installing now."
  mkdir /usr/share/xerosploit && cd /usr/share/xerosploit
  git clone https://github.com/LionSec/xerosploit
  cd xerosploit && python install.py
elif [[ -x "$(command -v xerosploit)" && ($RESPONSE = y || $RESPONSE = Y ) ]]; then
  echo "Xerosploit is already installed, skipping."
fi
echo ""
sleep 2

#cupp - Common User Passwords Profiler
banner_function CUPP
#find out if cupp.py exists on the system and store the return in a variable
echo "Searching for CUPP on your system, please wait."
file_search=$(find / -type f -name cupp.py 2>&1 | grep cupp.py)
echo -n "Would you like to install CUPP? (y/n) "
read RESPONSE
if [ $RESPONSE == n ] || [ $RESPONSE == N ]; then
  echo "CUPP will not be installed, moving to the next package."
elif [[ -z $file_search && ($RESPONSE = y || $RESPONSE = Y) ]]; then
  echo "CUPP is not currently installed, installing now."
  cd /usr/share/
  git clone https://github.com/Mebus/cupp.git
  cd cupp
  python3 cupp.py -v
#create an alias for cupp
  echo "Creating an alias for CUPP in ~/.bash_aliases."
  echo "You can use cupp to launch the cupp script from the command line."
  echo " alias cupp='python3 /usr/share/cupp/cupp.py'" >> ~/.bash_aliases
  sleep 5
elif [[ -n $file_search && ($RESPONSE = y || $RESPONSE = Y) ]]; then
  echo "CUPP is already installed, skipping."
fi
echo ""
sleep 2

#install the lazy script
banner_function The\ Lazy\ Script
echo -n "Would you like to install the lazy script? (y/n) "
read RESPONSE
if [ $RESPONSE == n ] || [ $RESPONSE == N ]; then
  echo "The lazy script will not be installed, moving to the next package."
elif [[ ! -x /root/lscript && ($RESPONSE = y || $RESPONSE = Y) ]]; then
  echo "The lazy script has not been installed, installing now..."
  cd /usr/share
  git clone https://github.com/arismelachroinos/lscript.git
  cd lscript
  chmod +x install.sh
  bash install.sh
elif [[ -x /root/lscript && ($RESPONSE = y || $RESPONSE = Y) ]]; then
  echo "The lazy script is already installed, skipping."
fi
echo ""
sleep 2

#install Aircard driver for TP-Link TN-722N (non virtualized build)
#check to see if the system is virtualized
banner_function TP\ Link\ WIFI\ Driver
virtcheck=$(dmidecode -s system-product-name)
if [ $virtcheck = VirtualBox ]; then
  echo "This system is virtualized, not installing wifi card drivers."
else
  echo "Non-virtualized system detected, installing drivers for TP-Link WIFI adapter."
  mkdir /home/kali/Downloads/TPLINK && cd /home/kali/Downloads/TPLINK
  git clone https://github.com/lwfinger/rtl8188eu.git
  cd rtl8188eu
  make && make install
fi
echo ""
echo "The installation script has finished! All optional packages installed."
