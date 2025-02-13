#!/usr/bin/bash

# .Xresources startup
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources &

# Some Nice Programs
exec /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1* &
exec firewall-applet &
exec nm-applet &
exec blueman-applet &
exec corectrl &
exec cbatticon &
exec picom &
exec greenclip daemon &
xsetroot -cursor_name left_ptr &
exec gsettings set org.gnome.desktop.interface color-scheme "prefer-dark" &
exec /usr/lib/mate-polkit/polkit-mate-authentication-agent-1 &
# exec volumeicon &
# exec sxhkd &
# exec feh --bg-scale /home/arsxhy/Downloads/Others/gitclone/wallpaper/first-collection/arch.png &
