#!/bin/bash
set -e

olddir=${HOME}/vimfiles_old

echo -e "Creating '$olddir' for existing files\n"
mkdir -p $olddir

files=".vimrc.first .vimrc.last .vimrc.plugins"

for file in $files; do
    if [ -f ${HOME}/$file ]; then
        echo "Moving existing $file -> $olddir/$file"
        mv ${HOME}/$file $oldir/
    fi

    echo -e "Creating symlink to $(pwd)/$file in home directory\n"
    ln -s  $(pwd)/$file ${HOME}/$file
done

if [ -f ${HOME}/.vimrc ]; then
    echo "Moving existing .vimrc -> $olddir/"
    mv ${HOME}/.vimrc $oldir/
fi

echo "Fetching vimconfig: https://github.com/timss/vimconf.git"
git clone https://github.com/timss/vimconf.git ~/vimconf
git checkout 23a01b3bcbfc13bfebd61f1da6b50a36b6e29e91

echo "Creating symlink to ~/vimconf/.vimrc in home directory."
ln -s ${HOME}/vimconf/.vimrc ${HOME}/.vimrc

source $HOME/.bashrc
