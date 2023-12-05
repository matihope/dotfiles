#!/usr/bin/fish

# Thanks to https://www.atlassian.com/git/tutorials/dotfiles
# for their great tutorial!

cd $HOME

# So that we don't create weird recursion problems
echo ".cfg" >> .gitignore

# Clone
git clone --bare git@github.com:matihope/dotfiles.git $HOME/.cfg

# For this scope
alias conf_path="/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME"

# If there were any configs already,
# make a backup of them :
# -- Create appropriate folders first
conf_path checkout 2>&1 | grep -E "\s+\." | awk '{print $1}' | xargs dirname | xargs -I{} mkdir -p .dotfiles-backup/{}
# -- Move files
conf_path checkout 2>&1 | grep -E "\s+\." | awk '{print $1}' | xargs -I{} mv {} .dotfiles-backup/{}

conf_path checkout
conf_path config --local status.showUntrackedFiles no

# cleanup
rm install.fish
rm README.md
