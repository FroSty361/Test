#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '
eval "$(starship init bash)"

playMusic()
{
  ~/.local/bin/playMusic.sh "$1"
}

playMusic ~/sounds/music/worldismine.mp3

clear

fastfetch

eval "$(starship init bash)"
