#!/bin/bash
set -e

olddir=~/dotfiles_old

echo "Creating '$olddir' for existing files"
mkdir -p $olddir

files=".bashrc .alias .vimrc.first .vimrc.last .vimrc.plugins .tmux.conf"

if [[ "$OSTYPE" == "darwin"* ]]; then
    files="${files} .bash_profile"
fi

for file in $files; do
    if [ -f "~/$file" ]; then
        echo "Moving existing $file -> $olddir/$file"
        mv ~/$file $oldir/
    fi

    echo "Creating symlink to $(pwd)/$file in home directory."
    ln -s  $(pwd)/$file ~/$file
done

if [ -f ~/.vimrc ]; then
    echo "Moving existing .vimrc -> $olddir/"
    mv ~/.vimrc $oldir/
fi

echo "Fetching vimconfig: https://github.com/timss/vimconf.git"
git clone https://github.com/timss/vimconf.git ~/vimconf

echo "Creating symlink to ~/vimconf/.vimrc in home directory."
ln -s ~/vimconf/.vimrc ~/.vimrc

source .bashrc
