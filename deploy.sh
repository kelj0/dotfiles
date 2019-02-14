#!/usr/bin/env bash

echo "Running kelj0 deploy script
-------------------------------------
| x  x xxx x     x  xxxx       xxxx |
| x x  x   x     x  x  x       x  x |
| xx   xxx x     x  x  x  x x  x  x |
| x x  x   x   x x  x  x   x   x  x |
| x  x xxx xxx x_x  xxxx  x x  xxxx |
-------------------------------------
"

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
&& $clone"Linux.git" \
&& $clone"dotfiles.git" \
&& $clone"Web-Dev.git" \
&& $clone"Brainfuck-interpreter.git"\
&& $clone"Learning-C.git" \
&& $clone"TestingArea.git"
echo done

echo "==========================
||    cp TestingArea    ||
==========================
"

cp -r /home/$USER/github/TestingArea ../
echo done

echo "TestingArea -> Testing"
mv ~/TestingArea ~/Testing
echo done

echo "rm .git from Testing"
sudo rm -rf /home/$USER/Testing/.git
echo done

echo "==========================
||     Adding bashrc    ||
==========================
"

sudo cp /home/$USER/github/dotfiles/.bashrc ~/
echo done

echo "
==========================
||     neovim stuff     ||
==========================
"
cd ~
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
sudo cp  /home/$USER/github/dotfiles/nvim/init.vim ~/.config/nvim # copy configs
echo "pip install neovim"
pip3 install --user neovim
pip install --user neovim

echo done

