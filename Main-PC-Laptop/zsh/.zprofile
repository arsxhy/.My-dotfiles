#
# zsh login shell config
#

# # nvm (node version manager) init.sh
# if [[ -e /usr/share/nvm/init-nvm.sh ]]; then
# 	. /usr/share/nvm/init-nvm.sh
# fi

export HISTFILE=$ZDOTDIR/.zsh_history
# source $ZDOTDIR/.zshrc
# Prevents duplicate entries in PATH
typeset -U path PATH
typeset -U fpath FPATH
