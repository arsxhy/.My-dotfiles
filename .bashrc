#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls -la1hF --color=auto'
alias grep='grep --color=auto'
alias cat='cat -n'
alias ip='ip -color=auto'
alias cp='cp -i'
alias rm='rm -i'
alias mv='mv -i'
alias tp-py='cd ~/Documents/Belajar-Otodidak/Belajar\ Programming/Belajar-Python3'
alias tp-webx='cd /opt/lampp/htdocs/10123354/'
alias grub-install-update='sudo grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=Arch_Linux --recheck'
alias update-grub='sudo grub-mkconfig -o /boot/grub/grub.cfg'
alias pactree='pactree -c'
alias pactrees='pactree -c -s'
alias py='python3'
alias reflector-mirror-update='sudo reflector --download-timeout 60 --age 12 --country Indonesia,Singapore --protocol https,rsync --sort rate --save /etc/pacman.d/mirrorlist'
alias yt-mp3='yt-dlp -P "~/Music/" --color=auto --extract-audio --audio-format mp3 --audio-quality 0 --embed-metadata --progress'
alias emacs='emacs -nw'
BLUE="\[$(tput setaf 6)\]"
RESET="\[$(tput sgr0)\]"
PS1="${BLUE}[\u@\h - \W]${RESET}>" 
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'
shopt -s autocd

