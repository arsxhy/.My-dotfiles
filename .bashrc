#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls -la1hF --color=auto'
alias grep='grep --color=auto'
alias cat='cat -n'
alias ip='ip -color=auto'
alias pactree='pactree -c'
alias pactrees='pactree -c -s'
alias yt-mp3='yt-dlp --color=auto --extract-audio --audio-format mp3 --audio-quality 0 --embed-metadata --progress'
BLUE="\[$(tput setaf 6)\]"
RESET="\[$(tput sgr0)\]"
PS1="${BLUE}[\u@\h \W]${RESET}>" 
MANPATH="${HOME}/.local/share/man:${MANPATH}"
shopt -s autocd
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

