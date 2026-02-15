##################################################################################################
# Startup Programs when the Shell or Terminal is Executed
# Don't append "exec" before some programs in '.bashrc' or you can't launch your terminal and get logout in tty
# neofetch (RIP neofetch 31 December 2015 - 26 April 2024)
fastfetch

# Evaluate Custom Perl Local::Lib
eval "$(perl -I$PERL_LOCAL_LIB_ROOT/lib/perl5 -Mlocal::lib=$PERL_LOCAL_LIB_ROOT)"

# Evaluate SSH Agent
eval $(keychain --eval --quiet id_ed25519)
eval $(keychain --eval --quiet id_rsa_test)

typeset -U path PATH
typeset -U fpath FPATH
fpath=($ZDOTDIR/functions $fpath)
autoload -Uz warna
zmodload zsh/parameter

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]; then
    . "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

if [ -e /usr/share/cachyos-zsh-config/cachyos-config.zsh ]; then
    . /usr/share/cachyos-zsh-config/cachyos-config.zsh
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[ ! -f $ZDOTDIR/.p10k.zsh ] || . $ZDOTDIR/.p10k.zsh

# Powerline Prompts
# if [ -r /usr/share/powerline/bindings/zsh/powerline.zsh ]; then
#     . /usr/share/powerline/bindings/zsh/powerline.zsh
# fi

# Cloudflare WARP CLI Completions
if [ -e $ZDOTDIR/completions/warp-cli ]; then
    . $ZDOTDIR/completions/warp-cli
fi

# Railwayapp CLI Completions
if [ -e $ZDOTDIR/completions/railway ]; then
    . $ZDOTDIR/completions/railway
fi

# nvm (node version manager) init.sh
# if [ -e /usr/share/nvm/init-nvm.sh ]; then
#     . /usr/share/nvm/init-nvm.sh
# fi

# Remembering recent directories
# eval "$(zoxide init zsh)"

# Evaluate rbenv init
eval "$(rbenv init -)"

# # bat completion zsh
# eval "$(bat --completion zsh)"

# dirscolors colorscheme (Tokyonight)
# Atur dircolors jika file tersedia
if [ -r ~/.dircolors ]; then
    eval "$(dircolors ~/.dircolors)"
fi

if [ -r $ZDOTDIR/fzf/themes/tokyonight_storm.sh ]; then
    source $ZDOTDIR/fzf/themes/tokyonight_storm.sh
fi

# My Function

# Python Startup
export PYTHONSTARTUP="$HOME/.pystartup"

# zsh specific config
# Hindari duplikat dalam history
setopt HIST_IGNORE_ALL_DUPS       # Hapus semua duplikat sebelumnya dari history
setopt HIST_SAVE_NO_DUPS          # Jangan simpan entri duplikat ke file history
setopt HIST_IGNORE_DUPS           # Abaikan duplikat langsung dari perintah sebelumnya
setopt HIST_FIND_NO_DUPS          # Saat search Ctrl+R, skip duplikat
setopt HIST_EXPIRE_DUPS_FIRST

# Opsi tambahan (opsional tapi sangat disarankan)
setopt HIST_REDUCE_BLANKS         # Hapus spasi berlebih dalam perintah
setopt INC_APPEND_HISTORY         # Simpan history langsung setelah perintah dijalankan

# My Aliases Config
alias ff='fastfetch'
alias ls='lsd --color=auto'
alias l='lsd --color=auto -la1Fh'
alias grep='grep --color=auto'
alias ip='ip -color=auto'
alias cp='cp -i'
alias rm='rm -i'
alias mv='mv -i'
alias lsblk='lsblk --tree -fs -o NAME,MAJ:MIN,FSTYPE,FSVER,PARTUUID,LABEL,SIZE,RO,TYPE,MOUNTPOINTS'
alias sudovim='sudo -E -s nvim -u "'"$HOME"'/.config/nvim/init.lua"'
alias tp-lua='cd ~/Documents/Belajar-Otodidak/Belajar\ Programming/Belajar-Lua'
alias tp-py='cd ~/Documents/Belajar-Otodidak/Belajar\ Programming/Belajar-Python3'
alias tp-java='cd ~/Documents/Belajar-Otodidak/Belajar\ Programming/Belajar-Java'
alias tp-c='cd ~/Documents/Belajar-Otodidak/Belajar\ Programming/Belajar-C-Language'
alias tp-cpp='cd ~/Documents/Belajar-Otodidak/Belajar\ Programming/Belajar-C++-Language'
alias tp-sh='cd ~/Documents/Belajar-Otodidak/Belajar\ Programming/Belajar-POSIX-Scripting'
alias tp-bash='cd ~/Documents/Belajar-Otodidak/Belajar\ Programming/Belajar-Bash-Scripting'
alias tp-zsh='cd ~/Documents/Belajar-Otodidak/Belajar\ Programming/Belajar-Zsh-Scripting'
alias tp-kuliah='cd ~/Documents/Kuliah/'
alias tp-smt3='cd ~/Documents/Kuliah/Semester\ 3\ -\ Teknik\ Informatika/'
alias tp-smt4='cd ~/Documents/Kuliah/Semester\ 4\ -\ Teknik\ Informatika/'
alias tp-webg='cd /opt/lampp/htdocs/10123354/'
alias tp-webx='cd /opt/lampp/htdocs/latihanSendiri/'
# alias controlFX17='java --module-path $PATH_TO_FX17 --add-modules javafx.controls'
# alias controlFX21='java --module-path $PATH_TO_FX21 --add-modules javafx.controls'
# SILENT_JAVA_OPTIONS="$JDK_JAVA_OPTIONS"
# unset JDK_JAVA_OPTIONS
# alias java='java "$SILENT_JAVA_OPTIONS"'
alias pingG='ping 8.8.8.8'
alias grub-install-update='sudo grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=cachyos --recheck'
alias update-grub='sudo grub-mkconfig -o /boot/grub/grub.cfg'
alias pactree='pactree -c'
alias pactrees='pactree -c -s'
alias py='python3'
alias gSS='gsettings set org.gnome.gnome-screenshot auto-save-directory "file:///home/arsxhy/Pictures/Screenshots/"'
alias reflector-mirror-update='sudo reflector --download-timeout 60 --age 12 --country Indonesia,Singapore --protocol https --sort rate --save /etc/pacman.d/mirrorlist'
alias yt-mp3='yt-dlp -P "~/Music/" --color=auto --extract-audio --audio-format mp3 --audio-quality 0 --embed-metadata --embed-thumbnail --progress'
alias yt-mp4='yt-dlp -P "~/Videos/YT-DLP/" --format "bv*[ext=mp4]+ba[ext=m4a]/b[ext=mp4]" --embed-metadata --embed-thumbnail --progress'
alias emacs='emacsclient -r -nw'
# alias AwesomeWM='startx ~/.xinitrc awesome'
# alias qtileX='startx ~/.xinitrc qtile'
# alias bspwmX='startx ~/.xinitrc bspwm'
# alias qtileW='startx ~/.xinitrc qtileWay'
alias mctl='java -jar ~/Downloads/TLauncher-2.*/TLauncher.jar'
alias tp-mctl='cd ~/Downloads/TLauncher-2.*/'
# alias vim='nvim'
alias mcaselector='java --module-path $PATH_TO_FX21 --add-modules javafx.controls -jar ~/Downloads/TLauncher-2.*/mcaselector-*.jar'
alias ncdu='ncdu -qe --color=dark-bg'

# Shell Debugging
# echo "DEBUG: \$- is '$-'"
# echo "DEBUG: tty check: $(tty)"
#
# if [[ $- == *i* ]]; then
#   echo "DEBUG: Shell is interactive"
# fi
#
# if [[ -t 1 ]]; then
#   echo "DEBUG: stdout is a terminal"
# fi
