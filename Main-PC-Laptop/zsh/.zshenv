#
##################################################################################################
# My Environment Variables Config
export MANPAGER="nvim +Man!"
export EDITOR=nvim
export VISUAL=nvim
export ANI_CLI_PLAYER='mpv'
export ANI_CLI_EXTERNAL_MENU='1'
export JAVA_HOME="/usr/lib/jvm/java-25-openjdk/"
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
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$XDG_CONFIG_HOME/composer/vendor/bin"
export PERL_LOCAL_LIB_ROOT="$HOME/.perl5/"
export INTELEPHENSE_STORAGE_PATH="$XDG_CACHE_HOME/intelephense"
# export FZF_DEFAULT_OPTS=""
# export PROTON_ENABLE_WAYLAND=1
# export PROTON_NO_WM_DECORATION=1
# export PROTON_PREFER_SDL_INPUT=1
