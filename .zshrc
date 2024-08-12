# Use powerline
USE_POWERLINE="true"
# Has weird character width
# Example:
#    is not a diamond
HAS_WIDECHARS="false"
# Source manjaro-zsh-configuration
if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
fi
# Use manjaro zsh prompt
if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
  source /usr/share/zsh/manjaro-zsh-prompt
fi
# pkgfile command not found
if [[ -e /usr/share/doc/pkgfile/command-not-found.zsh ]]; then
  source /usr/share/doc/pkgfile/command-not-found.zsh
fi
# nvm (node version manager) init.sh
if [[ -e /usr/share/nvm/init-nvm.sh ]]; then
  source /usr/share/nvm/init-nvm.sh
fi

# My Aliases Config
alias ls='lsd -la1hF --color=auto'
alias grep='grep --color=auto'
# alias cat='cat -n'
alias ip='ip -color=auto'
alias cp='cp -i'
alias rm='rm -i'
alias mv='mv -i'
alias tp-lua='cd ~/Documents/Belajar-Otodidak/Belajar\ Programming/Belajar-Lua'
alias tp-py='cd ~/Documents/Belajar-Otodidak/Belajar\ Programming/Belajar-Python3'
alias tp-java='cd ~/Documents/Belajar-Otodidak/Belajar\ Programming/Belajar-Java'
alias tp-c='cd ~/Documents/Belajar-Otodidak/Belajar\ Programming/Belajar-C-Language'
alias tp-cpp='cd ~/Documents/Belajar-Otodidak/Belajar\ Programming/Belajar-C++-Language'
alias tp-rs='cd ~/Documents/Belajar-Otodidak/Belajar\ Programming/Belajar-Rust/'
alias tp-sh='cd ~/Documents/Belajar-Otodidak/Belajar\ Programming/Belajar-Bash-Scripting'
alias tp-zsh='cd /home/arsxhy/Documents/Belajar-Otodidak/Belajar\ Programming/Belajar-Zsh-Scripting'
# alias arrpc='node --trace-warnings ~/Downloads/Others/Discord\ Rich-Presence/arrpc/src'
alias tp-webg='cd /opt/lampp/htdocs/10123354/'
alias tp-webx='cd /opt/lampp/htdocs/latihanSendiri/'
alias controlFX17='java --module-path $PATH_TO_FX17 --add-modules javafx.controls'
alias controlFX21='java --module-path $PATH_TO_FX21 --add-modules javafx.controls'
# SILENT_JAVA_OPTIONS="$JDK_JAVA_OPTIONS"
# unset JDK_JAVA_OPTIONS
# alias java='java "$SILENT_JAVA_OPTIONS"'
alias pingG='ping 8.8.8.8'
# alias grub-install-update='sudo grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=ArchLinux --recheck'
# alias update-grub='sudo grub-mkconfig -o /boot/grub/grub.cfg'
alias pactree='pactree -c'
alias pactrees='pactree -c -s'
alias py='python3'
# alias simpleTrigs='python3 ~/.myPythonScript/simpleMath/simple-trigs.py'
alias gtk4Dark='gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"'
alias gSS='gsettings set org.gnome.gnome-screenshot auto-save-directory "file:///home/arsxhy/Pictures/Screenshots/"'
alias reflector-mirror-update='sudo reflector --download-timeout 60 --age 12 --country Indonesia,Singapore --protocol https,rsync --sort rate --save /etc/pacman.d/mirrorlist'
alias yt-mp3='yt-dlp -P "~/Music/" --color=auto --extract-audio --audio-format mp3 --audio-quality 0 --embed-metadata --progress'
alias yt-mp4='yt-dlp -P "~/Videos/YT-DLP/" --format "bv*[ext=mp4]+ba[ext=m4a]/b[ext=mp4]" --embed-metadata --progress'
alias emacs='emacs -nw'
alias qtileX='startx ~/.xinitrc qtile'
alias bspwmX='startx ~/.xinitrc bspwm'
# alias qtileW='startx ~/.xinitrc qtileWay'
alias mctl='java -jar ~/Downloads/TLauncher-2.*/TLauncher-*.jar'
alias tp-mctl='cd ~/Downloads/TLauncher-2.*/'
alias vim='nvim'
alias mcaselector='java --module-path $PATH_TO_FX21 --add-modules javafx.controls -jar ~/Downloads/TLauncher-2.*/mcaselector-*.jar'
#################################################################################################################################

# My Environment Variables Config
MANPATH="${HOME}/.local/share/man:${MANPATH}"
MANPAGER="nvim +Man!"
PAGER="nvimpager -p"
# SYSTEMD_PAGER="nvimpager -p"
PYTHONSTARTUP="$(python -m jedi repl)"
LS_COLORS='rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=00:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.zst=01;31:*.tzst=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.wim=01;31:*.swm=01;31:*.dwm=01;31:*.esd=01;31:*.avif=01;35:*.jpg=01;35:*.jpeg=01;35:*.mjpg=01;35:*.mjpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.webp=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:*~=00;90:*#=00;90:*.bak=00;90:*.crdownload=00;90:*.dpkg-dist=00;90:*.dpkg-new=00;90:*.dpkg-old=00;90:*.dpkg-tmp=00;90:*.old=00;90:*.orig=00;90:*.part=00;90:*.rej=00;90:*.rpmnew=00;90:*.rpmorig=00;90:*.rpmsave=00;90:*.swp=00;90:*.tmp=00;90:*.ucf-dist=00;90:*.ucf-new=00;90:*.ucf-old=00;90:';
export LS_COLORS
export MANPAGER
export PAGER
# export QT_QPA_PLATFORM="wayland;xcb"
export FZF_DEFAULT_OPTS="
	--color=fg:#908caa,bg:#232136,hl:#ea9a97
	--color=fg+:#e0def4,bg+:#393552,hl+:#ea9a97
	--color=border:#44415a,header:#3e8fb0,gutter:#232136
	--color=spinner:#f6c177,info:#9ccfd8,separator:#44415a
	--color=pointer:#c4a7e7,marker:#eb6f92,prompt:#908caa"
# export SYSTEMD_PAGER
export PYTHONSTARTUP
export RANGER_LOAD_DEFAULT_RC="false"
export GEM_HOME="$(ruby -e 'puts Gem.user_dir')"
export PATH="$PATH:$GEM_HOME/bin"
eval $(perl -I ~/perl5/lib/perl5/ -Mlocal::lib)
export PERL_CPANM_HOME=/tmp/cpanm_$USER
export PATH_TO_FX17="/usr/lib/jvm/java-17-openjdk/lib/javafx.base.jar:/usr/lib/jvm/java-17-openjdk/lib/javafx.controls.jar:/usr/lib/jvm/java-17-openjdk/lib/javafx.graphics.jar:/usr/lib/jvm/java-17-openjdk/lib/javafx-swt.jar:/usr/lib/jvm/java-17-openjdk/lib/javafx.fxml.jar:/usr/lib/jvm/java-17-openjdk/lib/javafx.media.jar:/usr/lib/jvm/java-17-openjdk/lib/javafx.web.jar"
export PATH_TO_FX_MODS17='/usr/lib/jvm/java-17-openjdk/jmods/javafx.base.jmod:/usr/lib/jvm/java-17-openjdk/jmods/javafx.controls.jmod:/usr/lib/jvm/java-17-openjdk/jmods/javafx.fxml.jmod:/usr/lib/jvm/java-17-openjdk/jmods/javafx.graphics.jmod:/usr/lib/jvm/java-17-openjdk/jmods/javafx.media.jmod:/usr/lib/jvm/java-17-openjdk/jmods/javafx.swing.jmod:/usr/lib/jvm/java-17-openjdk/jmods/javafx.web.jmod'
export PATH_TO_FX21="/usr/lib/jvm/java-21-openjdk/lib/javafx.base.jar:/usr/lib/jvm/java-21-openjdk/lib/javafx.controls.jar:/usr/lib/jvm/java-21-openjdk/lib/javafx.graphics.jar:/usr/lib/jvm/java-21-openjdk/lib/javafx-swt.jar:/usr/lib/jvm/java-21-openjdk/lib/javafx.fxml.jar:/usr/lib/jvm/java-21-openjdk/lib/javafx.media.jar:/usr/lib/jvm/java-21-openjdk/lib/javafx.web.jar"
export PATH_TO_FX_MODS21='/usr/lib/jvm/java-21-openjdk/jmods/javafx.base.jmod:/usr/lib/jvm/java-21-openjdk/jmods/javafx.controls.jmod:/usr/lib/jvm/java-21-openjdk/jmods/javafx.fxml.jmod:/usr/lib/jvm/java-21-openjdk/jmods/javafx.graphics.jmod:/usr/lib/jvm/java-21-openjdk/jmods/javafx.media.jmod:/usr/lib/jvm/java-21-openjdk/jmods/javafx.swing.jmod:/usr/lib/jvm/java-21-openjdk/jmods/javafx.web.jmod'
export JAVA_HOME="/usr/lib/jvm/default"
export PATH="$PATH:$JAVA_HOME/bin"
export PATH="/usr/lib/colorgcc/bin:$PATH"
export NODE_PATH="/usr/lib/node_modules"
export PATH="$PATH:$NODE_PATH"
export CCACHE_PATH="/usr/bin"
# export PATH="/var/lib/flatpak/exports/share:/root/.local/share:$PATH"
# export XDG_DATA_DIRS="/root/.local/share:$XDG_DATA_DIRS"
# export LDFLAGS="$(echo ${LDFLAGS} | sed -e 's|[[:space:]][[:space:]]|[[:space:]]|g' -e 's|\n||g')"
# export CMAKE_BUILD_PARALLEL_LEVEL=8
# export all_proxy="dns://localhosr:5300"
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'
#################################################################################################################################
# Startup Programs when the Shell or Terminal is Executed
# Don't append "exec" before some programs in '.bashrc' or you can't launch your terminal and get logout in tty
# neofetch (RIP neofetch 31 December 2015 - 26 April 2024)
fastfetch
# eval "$(rbenv init -)"
# (cat ~/.cache/wal/sequences &)
# source ~/.cache/wal/colors-tty.sh
