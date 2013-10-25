#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
files="bashrc vimrc zshrc vimperatorrc vimperatorrc.local"    # list of files/folders to symlink in homedir

##########

# create dotfiles_old in homedir
echo "creating directory $olddir"
mkdir -p $olddir

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for file in $files; do
    ln -s $dir/$file $dir/.$file
    if [ -e ~/.$file ]; then #if an dotfile with file name already exists
        if [ $dir/.$file -ef ~/.$file ]; then #if it is just a symlink already
            rm $dir/.$file
        else
            mv -v ~/.$file $olddir
            mv -v $dir/.$file ~
        fi
    else
        mv -v $dir/.$file ~
    fi
done

if [ "$(find $olddir -type d -empty)" ]; then
    echo "no old dotfiles replaced, removing directory $olddir"
    rm -r $olddir
fi
