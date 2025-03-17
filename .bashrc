# Sample .bashrc for SUSE Linux
# Copyright (c) SUSE Software Solutions Germany GmbH

# There are 3 different types of shells in bash: the login shell, normal shell
# and interactive shell. Login shells read ~/.profile and interactive shells
# read ~/.bashrc; in our setup, /etc/profile sources ~/.bashrc - thus all
# settings made here will also take effect in a login shell.
#
# NOTE: It is recommended to make language settings in ~/.profile rather than
# here, since multilingual X sessions would not work properly if LANG is over-
# ridden in every subshell.

test -s ~/.alias && . ~/.alias || true

# My Prompt Config
NILA="\[$(tput setaf 14)\]"
GREEN="\[$(tput setaf 41)\]"
RESET="\[$(tput sgr0)\]"
PS1="${NILA}[\u@\h at \A - \W]${RESET}${GREEN}-$>${RESET}"
#################################################################################################################################
# My Bash Shell Behaviour
shopt -s autocd
shopt -s checkwinsize
#################################################################################################################################
# My Bash Shell Functions
# Run-Help Ability
run-help() { help "$READLINE_LINE" 2>/dev/null || man "$READLINE_LINE"; }
bind -m vi-insert -x '"\eh": run-help'
bind -m emacs -x     '"\eh": run-help'
#################################################################################################################################

#################################################################################################################################
# My Environment Variables Config
MANPATH="${HOME}/.local/share/man:/usr/local/share/man/:${MANPATH}"
MANPAGER="nvim +Man!"
# PAGER="nvimpager -p"
# SYSTEMD_PAGER="nvimpager -p"
PYTHONSTARTUP="$(python3 -m jedi repl)"
# Default LS_COLORS
# LS_COLORS='rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=00:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.zst=01;31:*.tzst=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.wim=01;31:*.swm=01;31:*.dwm=01;31:*.esd=01;31:*.avif=01;35:*.jpg=01;35:*.jpeg=01;35:*.mjpg=01;35:*.mjpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.webp=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:*~=00;90:*#=00;90:*.bak=00;90:*.crdownload=00;90:*.dpkg-dist=00;90:*.dpkg-new=00;90:*.dpkg-old=00;90:*.dpkg-tmp=00;90:*.old=00;90:*.orig=00;90:*.part=00;90:*.rej=00;90:*.rpmnew=00;90:*.rpmorig=00;90:*.rpmsave=00;90:*.swp=00;90:*.tmp=00;90:*.ucf-dist=00;90:*.ucf-new=00;90:*.ucf-old=00;90:';

# Dracula LS_COLORS
# LS_COLORS='/etc/DIR_COLORS.dracula'
# export LS_COLORS
d=.dircolors
test -r $d && eval "$(dircolors $d)"
# export GTK_THEME="Artix-dark"
# export ICON_THEME="Mint-L-Blue"
export MANPAGER
export PAGER
# export SYSTEMD_PAGER
export PYTHONSTARTUP
export XDG_MENU_PREFIX='plasma- run kbuildsycoca6'
export ANI_CLI_PLAYER='vlc'
# export RANGER_LOAD_DEFAULT_RC="false"
# export GEM_HOME="$(ruby -e 'puts Gem.user_dir')"
# export PATH="$PATH:$GEM_HOME/bin"
# eval $(perl -I ~/perl5/lib/perl5/ -Mlocal::lib)
# export PERL_CPANM_HOME=/tmp/cpanm_$USER
export JDK_JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel -Dawt.toolkit.name=WLToolkit'
# export PATH_TO_FX17="/usr/lib/jvm/java-17-openjdk/lib/javafx.base.jar:/usr/lib/jvm/java-17-openjdk/lib/javafx.controls.jar:/usr/lib/jvm/java-17-openjdk/lib/javafx.graphics.jar:/usr/lib/jvm/java-17-openjdk/lib/javafx-swt.jar:/usr/lib/jvm/java-17-openjdk/lib/javafx.fxml.jar:/usr/lib/jvm/java-17-openjdk/lib/javafx.media.jar:/usr/lib/jvm/java-17-openjdk/lib/javafx.web.jar"
# export PATH_TO_FX_MODS17='/usr/lib/jvm/java-17-openjdk/jmods/javafx.base.jmod:/usr/lib/jvm/java-17-openjdk/jmods/javafx.controls.jmod:/usr/lib/jvm/java-17-openjdk/jmods/javafx.fxml.jmod:/usr/lib/jvm/java-17-openjdk/jmods/javafx.graphics.jmod:/usr/lib/jvm/java-17-openjdk/jmods/javafx.media.jmod:/usr/lib/jvm/java-17-openjdk/jmods/javafx.swing.jmod:/usr/lib/jvm/java-17-openjdk/jmods/javafx.web.jmod'
# export PATH_TO_FX21="/usr/lib/jvm/java-21-openjdk/lib/javafx.base.jar:/usr/lib/jvm/java-21-openjdk/lib/javafx.controls.jar:/usr/lib/jvm/java-21-openjdk/lib/javafx.graphics.jar:/usr/lib/jvm/java-21-openjdk/lib/javafx-swt.jar:/usr/lib/jvm/java-21-openjdk/lib/javafx.fxml.jar:/usr/lib/jvm/java-21-openjdk/lib/javafx.media.jar:/usr/lib/jvm/java-21-openjdk/lib/javafx.web.jar"
# export PATH_TO_FX_MODS21='/usr/lib/jvm/java-21-openjdk/jmods/javafx.base.jmod:/usr/lib/jvm/java-21-openjdk/jmods/javafx.controls.jmod:/usr/lib/jvm/java-21-openjdk/jmods/javafx.fxml.jmod:/usr/lib/jvm/java-21-openjdk/jmods/javafx.graphics.jmod:/usr/lib/jvm/java-21-openjdk/jmods/javafx.media.jmod:/usr/lib/jvm/java-21-openjdk/jmods/javafx.swing.jmod:/usr/lib/jvm/java-21-openjdk/jmods/javafx.web.jmod'
export PATH="/usr/lib/colorgcc/bin:$PATH"
export CCACHE_PATH="/usr/bin"
export LIBVIRT_DEFAULT_URI='qemu:///system'
# export PATH="/var/lib/flatpak/exports/share:/root/.local/share:$PATH"
# export XDG_DATA_DIRS="/root/.local/share:$XDG_DATA_DIRS"
# export LDFLAGS="$(echo ${LDFLAGS} | sed -e 's|[[:space:]][[:space:]]|[[:space:]]|g' -e 's|\n||g')"
# export all_proxy="dns://localhost:5300"
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'
#################################################################################################################################
# Startup Programs when the Shell or Terminal is Executed
if [ "$TERM" = "linux" ]; then
	printf %b '\e[40m' '\e[8]' # set default background to color 0 'dracula-bg'
	printf %b '\e[37m' '\e[8]' # set default foreground to color 7 'dracula-fg'
	printf %b '\e]P0282a36'    # redefine 'black'          as 'dracula-bg'
	printf %b '\e]P86272a4'    # redefine 'bright-black'   as 'dracula-comment'
	printf %b '\e]P1ff5555'    # redefine 'red'            as 'dracula-red'
	printf %b '\e]P9ff7777'    # redefine 'bright-red'     as '#ff7777'
	printf %b '\e]P250fa7b'    # redefine 'green'          as 'dracula-green'
	printf %b '\e]PA70fa9b'    # redefine 'bright-green'   as '#70fa9b'
	printf %b '\e]P3f1fa8c'    # redefine 'brown'          as 'dracula-yellow'
	printf %b '\e]PBffb86c'    # redefine 'bright-brown'   as 'dracula-orange'
	printf %b '\e]P4bd93f9'    # redefine 'blue'           as 'dracula-purple'
	printf %b '\e]PCcfa9ff'    # redefine 'bright-blue'    as '#cfa9ff'
	printf %b '\e]P5ff79c6'    # redefine 'magenta'        as 'dracula-pink'
	printf %b '\e]PDff88e8'    # redefine 'bright-magenta' as '#ff88e8'
	printf %b '\e]P68be9fd'    # redefine 'cyan'           as 'dracula-cyan'
	printf %b '\e]PE97e2ff'    # redefine 'bright-cyan'    as '#97e2ff'
	printf %b '\e]P7f8f8f2'    # redefine 'white'          as 'dracula-fg'
	printf %b '\e]PFffffff'    # redefine 'bright-white'   as '#ffffff'
	clear
fi
# Don't append "exec" before some programs in '.bashrc' or you can't launch your terminal and get logout in tty
# neofetch (RIP neofetch 31 December 2015 - 26 April 2024)
fastfetch
# eval "$(rbenv init -)"
# (cat ~/.cache/wal/sequences &)
# source ~/.cache/wal/colors-tty.sh
# source /usr/share/nvm/init-nvm.sh

# NVM (Node Version Manager)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
