#!/usr/bin/bash

# Thanks to https://www.atlassian.com/git/tutorials/dotfiles
# for their great tutorial!


# So that we don't create weird recursion problems
echo ".cfg" >> .gitignore

# Clone
git clone --bare https://github.com/matihope/dotfiles.git $HOME/.cfg

# For this scope
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# If there were any configs already,
# make a backup of them.
mkdir -p .config-backup && \
config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | \
xargs -I{} mv {} .config-backup/{}

config checkout
config config --local status.showUntrackedFiles no
