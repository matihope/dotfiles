#!/usr/bin/fish

# Thanks to https://www.atlassian.com/git/tutorials/dotfiles
# for their great tutorial!


# So that we don't create weird recursion problems
echo ".cfg" >> .gitignore

# Clone
git clone --bare https://github.com/matihope/dotfiles.git $HOME/.cfg

# For this scope
set config '/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# If there were any configs already,
# make a backup of them :
# -- Create appropriate folders first
$config checkout 2>&1 | grep -E "\s+\." | awk '{print $1}' | xargs dirname | xargs -I{} mkdir -p .dotfiles-backup/{}
# -- Move files
$config checkout 2>&1 | grep -E "\s+\." | awk '{print $1}' | xargs -I{} mv {} .dotfiles-backup/{}

$config checkout
$config config --local status.showUntrackedFiles no

# cleanup
rm install.fish
rm README.md
