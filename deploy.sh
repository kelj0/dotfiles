echo "
==================================
Creating Testing and github folder
==================================
"
mkdir /home/$USER/Testing /home/$USER/github

echo done
echo "
=============
Cloning repos
=============
"
cd /home/$USER/github
git clone https://github.com/kelj0/LearningPython.git \
&& git clone https://github.com/kelj0/Linux.git \
&& git clone https://github.com/kelj0/dotfiles.git \
&& git clone https://github.com/kelj0/Web-Dev.git \
&& git clone https://github.com/kelj0/Brainfuck-interpreter.git

echo done

cd ../Testing

echo "
=============================================
Creating python cpp shell and web-dev folders
=============================================
"

mkdir python CPP Shell Web-dev
echo done

echo "
==============
Adding aliases
==============
"
wget -O - https://pastebin.com/raw/MGnjz0sy >> ~/.bashrc && . ~/.bashrc