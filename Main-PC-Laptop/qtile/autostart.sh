#!/usr/bin/bash

# .Xresources startup
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources &

# Some Nice Programs
/usr/bin/pipewire &
/usr/bin/pipewire-pulse &
/usr/bin/wireplumber &
exec /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
exec /opt/abdownloadmanager/bin/ABDownloadManager --background &
# exec firewall-applet &
exec gufw_icon.sh &
exec nm-applet &
exec blueman-tray &
exec corectrl &
exec cbatticon &
exec picom &
exec greenclip daemon &
xsetroot -cursor_name left_ptr &
exec gsettings set org.gnome.desktop.interface color-scheme "prefer-dark" &
# exec /usr/lib/mate-polkit/polkit-mate-authentication-agent-1 &
# exec volumeicon &
# exec sxhkd &
# exec feh --bg-scale /home/arsxhy/Downloads/Others/gitclone/wallpaper/first-collection/arch.png &
