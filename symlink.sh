#!/bin/bash
############################
# symlink.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################
source ~/.bashrc
shopt -s expand_aliases

#function to test for ability for move to backup destination files
function has_mv_with_backup()
{
    f1=$(mktemp "$0.XXXXXXXXXX")
    f2=$(mktemp "$0.XXXXXXXXXX")
    rm $f2
    mv --backup=t $f1 $f2 > /dev/null 2>&1
    status=$?
    mv $f1 $f2 > /dev/null 2>&1
    rm $f2
    return $status
}

########## Variables

dir="`dirname \"$0\"`"              # relative path to script directory
dir="`( cd \"$dir\" && pwd )`"      # absolutized and normalized
olddir="${dir}_old"                 # old dotfiles backup directory
files="bashrc vimrc zshrc spacemacs"    # list of files/folders to symlink in homedir

##########

# create olddir
echo "creating directory $olddir"
mkdir -p $olddir

# set available move command
MV='mv -v'
if $(has_mv_with_backup); then
    MV+=' --backup=t'
fi

echo $MV

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks
for file in $files; do
    ln -s $dir/$file $dir/.$file
    if [ -e ~/.$file ]; then #if a dotfile with file name already exists
        if [ $dir/.$file -ef ~/.$file ]; then #if it is just a symlink already
            rm $dir/.$file
        else
            $MV ~/.$file $olddir
            $MV $dir/.$file ~
        fi
    else
       $MV $dir/.$file ~
    fi
done

if [ "$(find $olddir -type d -empty)" ]; then
    echo "no old dotfiles replaced, removing directory $olddir"
    rm -rf $olddir
fi
