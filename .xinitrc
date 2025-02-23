#!/bin/sh

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources &
# exec /etc/X11/xinit/xinitrc.d/50-systemd-user.sh &
# exec dbus-update-activation-environment --all &
# /usr/lib/polkit-kde-authentication-agent-1 &
exec firewall-applet &
exec /usr/lib/mate-polkit/polkit-mate-authentication-agent-1 &
exec nm-applet &
exec blueman-applet &
# exec volumeicon &
exec cbatticon &
exec corectrl &
exec picom &
exec greenclip daemon &
exec libinput-gestures-setup autostart &
# exec sxhkd &
# exec feh --bg-scale /usr/share/backgrounds/archlinux/awesome.png &
# exec feh --bg-scale ~/Pictures/Wallpapers/archlinux-magenta-blue.png &
exec feh --bg-scale /home/arsxhy/Downloads/Others/gitclone/wallpaper/first-collection/arch.png &
# exec feh --bg-scale /home/arsxhy/Downloads/Bahan-bahan\ ganti\ Themes/Rose-Pines/wallpapers/leafy-moon.png
xsetroot -cursor_name left_ptr &
exec gsettings set org.gnome.desktop.interface color-scheme "prefer-dark" &

# Here i3 is kept as default
session=${1:-awesome}

case $session in
	qtile		) exec qtile start;;
	awesome		) exec awesome;;
#	Hyprland	) exec Hyprland;;
#	i3|i3wm		) exec i3;;
#	bspwm		) exec bspwm;;
	
	# No Known Session, Try to Run it as command
	*		) exec $1;;
esac

# echo "Pilih Window Manager: "
# echo "1. Qtile"
# echo "2. AwesomeWM"
# echo "3. Hyprland"

# read wm_choice -p "Masukkan Nomor: "

# case $wm_choice in
#	1)
#		exec qtile start
#		;;
#	2)
#		exec awesome
#		;;
#	3)
#		exec Hyprland
#		;;
#	*)
#		echo "Pilihan tidak valid, memulai default (Qtile)"
#		exec qtile start
#		;;
# esac
