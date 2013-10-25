dotfiles
========

Run `symlink.sh` to create symlinks to these dotfiles in the HOME directory.

This script will move dotfiles to ~/dotfiles_old, not overwrite them.

~/dotfiles_old will be removed automatically if there were no conflicts.

The current `symlink.sh` script relies on this repo being checked out to the HOME directory (with contents in ~/dotfiles).
Edit the script (change the `dir` variable) if this is not the case.
