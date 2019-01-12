#!/usr/bin/env bash

echo "
==========================
||Creating Github folder||
==========================
"
mkdir /home/$USER/github
echo done

echo "
==========================
||    Cloning repos     ||
==========================
"
clone="git clone https://github.com/kelj0/"
cd /home/$USER/github
$clone"LearningPython.git" \
&& $clone"Linux.git" \
&& $clone"dotfiles.git" \
&& $clone"Web-Dev.git" \
&& $clone"Brainfuck-interpreter.git"
&& $clone"Learning-C.git" \
&& $clone"TestingArea.git"
echo done

echo "
==========================
|| Cloning TestingArea  ||
==========================
"
cd ../ && $clone"TestingArea.git"
echo done

echo "TestingArea -> Testing"
mv TestingArea Testing
echo done

echo "rm .git from Testing"
sudo rm -rf /home/$USER/Testing/.git
echo done

echo "
==========================
||    Adding aliases    ||
==========================
"
wget -O - https://pastebin.com/raw/tjH1gndT >> ~/.bashrc && . ~/.bashrc
echo done
echo Dont forget to append xfiles to bashrc! (https://pastebin.com/raw/h1SPeRCr)
