#
##################################################################################################
# My Environment Variables Config
export MANPAGER="nvim +Man!"
export EDITOR=nvim
export VISUAL=nvim
export ANI_CLI_PLAYER='mpv'
export ANI_CLI_EXTERNAL_MENU='1'
export JAVA_HOME="/usr/lib/jvm/java-21-openjdk/"
# export HYPRCURSOR_THEME="hyprcursor_Dracula"
# export HYPRCURSOR_SIZE=24
# export PATH="/home/arsxhy/.local/bin:/home/arsxhy/.cargo/bin:/usr/lib/colorgcc/bin:$PATH"
# export CCACHE_PATH="/usr/bin"
export LIBVIRT_DEFAULT_URI='qemu:///system'
# Ukuran history (dapat disesuaikan)
export HISTSIZE=10000
export SAVEHIST=10000
export HISTFILE=$ZDOTDIR/.zsh_history
export HISTCONTROL=ignoreboth
export HISTIGNORE="&:[bf]g:c:clear:history:exit:q:pwd:* --help"
export GEM_HOME="$(ruby -e 'puts Gem.user_dir')"
export NODE_PATH="/usr/lib/node_modules/:$HOME/.local/share/npm-packages/node_modules/"
export PATH="$PATH:$GEM_HOME/bin"
export PERL_LOCAL_LIB_ROOT="$HOME/.perl5/"
export FZF_DEFAULT_OPTS="--color=fg:#f8f8f2,bg:#282a36,hl:#bd93f9
--color=fg+:#f8f8f2,bg+:#44475a,hl+:#bd93f9
--color=info:#ffb86c,prompt:#50fa7b,pointer:#ff79c6
--color=marker:#ff79c6,spinner:#ffb86c,header:#6272a4"
# export PROTON_ENABLE_WAYLAND=1
# export PROTON_NO_WM_DECORATION=1
# export PROTON_PREFER_SDL_INPUT=1
