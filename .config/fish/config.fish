if status is-interactive
    # Commands to run in interactive sessions can go here
end

# For bobthefish
set theme_nerd_fonts yes
set theme_display_git yes

# For storing dotfiles.
# Making it an alias, so it doesn't
# spit out this whole line
alias config='/usr/bin/git --git-dir=$HOME/.cfg --work-tree=$HOME'

# misc 
abbr q "exit"
abbr sp "sudo pacman"
abbr n "nvim"
abbr sn "sudo nvim"
abbr ss "sudo systemctl"
