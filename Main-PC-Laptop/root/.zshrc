# Lines configured by zsh-newuser-install
HISTFILE=$ZDOTDIR/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt autocd beep nomatch notify
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '$ZDOTDIR/.zshrc'

PROMPT='[%F{red}%n%f@%F{magenta}%m%f %F{blue}%B%2~%b%f %#] '
RPROMPT='[%F{yellow}%?%f]'

autoload -Uz compinit
compinit
# End of lines added by compinstall

if [ -r $HOME/.dircolors ]; then
    eval "$(dircolors $HOME/.dircolors)"
fi
