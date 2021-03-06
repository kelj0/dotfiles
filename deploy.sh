#!/usr/bin/env bash
echo "Running kelj0 deploy script
-------------------------------------
| xxxx       x  x xxx x     x  xxxx |
| x  x       x x  x   x     x  x  x |
| x  x  x x  xx   xxx x     x  x  x |
| x  x   x   x x  x   x   x x  x  x |
| xxxx  x x  x  x xxx xxx x_x  xxxx |
-------------------------------------
"
sudo apt update && sudo apt upgrade
sudo apt install synaptic apt-xapian-index policykit-1-gnome curl wget redshift vim vim-gtk libclang1 -y

echo "==========================
||Creating Github folder||
==========================
"

mkdir /home/$USER/github
echo done

echo "==========================
||    Cloning repos     ||
==========================
"

clone="git clone https://github.com/kelj0/"
cd /home/$USER/github
$clone"LearningPython.git" \
&& $clone"dotfiles.git" \
echo done

echo "
==========================
||   Installing vscode  ||
==========================
"
cd ~/Downloads
wget -O vscode.deb https://go.microsoft.com/fwlink/?LinkID=760868
sudo dpkg -i vscode.deb
rm vscode.deb
echo Installing pip,tmux...
sudo apt install mc w3m links python-pip python3-pip -y
echo done

echo "
==========================
||     Adding bashrc    ||
==========================
"

sudo cp /home/$USER/github/dotfiles/.bashrc ~/
echo done

echo "
==========================
||    (neo)vim stuff    ||
==========================
"
cd ~
cp /home/$USER/github/dotfiles/.vimrc ~
sudo ln -s /usr/lib/x86_64-linux-gnu/libclang07.so.1 libclang.so
echo "download and install appimage"
wget --quiet https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage --output-document nvim # download and install appimage
echo "make nvim accessible to all users"
chmod +x nvim # make nvim accessible to all users
sudo chown root:root nvim
echo "move bin file"
sudo mv nvim /usr/bin # move bin file 
mkdir -p ~/.config/nvim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim # vim plugin manager
echo "copy configs"
sudo cp  /home/$USER/github/dotfiles/init.vim ~/.config/nvim/init.vim # copy configs
echo "pip install neovim"
sudo apt install python-pip
sudo apt install python3-pip
pip3 install --user neovim
pip install --user neovim
nvim -E -c PlugInstall -c q
echo done

sudo apt install tmux -y
echo "mv tmux config"
cp /home/$USER/github/dotfiles/.tmux.conf ~
echo done


echo "
=========================
||   Theme and icons   ||
=========================
"
sudo apt install gtk2-engines-murrine gtk2-engines-pixbuf
cd ~/Downloads
sudo tar -xvfz /home/$USER/github/dotfiles/Matcha*.gz -C /usr/share/themes
wget 'https://snwh.org/paper/download.php?owner=snwh&ppa=ppa&pkg=paper-icon-theme,18.04' -O paper.deb
sudo dpkg -i paper.deb
sudo apt install -f
echo Sleeping for 5s so you can read next line
echo "To change theme go to settings->appearance choose Matcha-dark-cold and Paper icons"
sleep 5

echo "
===================
||    Discord    ||
===================
"
wget 'https://discordapp.com/api/download?platform=linux&format=deb' -O disc.deb
sudo dpkg -i disc.deb

echo "
==================
||  VirtualBox  ||
==================
"
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -
echo "deb http://download.virtualbox.org/virtualbox/debian bionic contrib" | sudo tee -a /etc/apt/sources.list 
sudo apt update
sudo apt install virtualbox-6.0

sudo apt update && sudo apt upgrade
sudo apt --fix-broken install
rm ~/Downloads/*
rm -rf ~/dotfiles

