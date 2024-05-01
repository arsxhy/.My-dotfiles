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
# exec firewall-applet &
exec /usr/lib/mate-polkit/polkit-mate-authentication-agent-1 &
exec nm-applet &
exec blueman-applet &
# exec sxhkd &
# exec feh --bg-scale /usr/share/backgrounds/archlinux/awesome.png &
# exec feh --bg-scale ~/Pictures/Wallpapers/autumn-october-2023-release-by-sulcetech-3840-x-2160-v0.jpg &
exec feh --bg-scale /home/arsxhy/Downloads/Bahan-bahan\ ganti\ Themes/Rose-Pines/wallpapers/leafy-moon.png
xsetroot -cursor_name left_ptr &

# Here i3 is kept as default
session=${1:-i3}

case $session in
	i3|i3wm		) exec i3;;
	qtile		) exec qtile start;;
	bspwm		) exec bspwm;;
	
	# No Known Session, Try to Run it as command
	*		) exec $1;;
esac
