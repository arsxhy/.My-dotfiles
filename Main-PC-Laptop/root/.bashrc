#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Source Config
source ~/.alias_root

# My Prompt Config
RED="\[$(tput setaf 15)\]"
GREEN="\[$(tput setaf 41)\]"
RESET="\[$(tput sgr0)\]"
PS1="${RED}[\u@\h at \A - \W]${RESET}${GREEN}-#>${RESET}"

##################################################################################################
# My Bash Shell Behaviour
shopt -s autocd
shopt -s checkwinsize

##################################################################################################
# My Environment Variables Config
export MANPAGER="nvim +Man!"
export PYTHONSTARTUP="$(python3 -m jedi repl)"
export PATH="/usr/lib/colorgcc/bin:$PATH"
export CCACHE_PATH="/usr/bin"

##################################################################################################
# Startup Programs when the Shell or Terminal is Executed
fastfetch
