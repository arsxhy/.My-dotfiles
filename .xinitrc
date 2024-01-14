source /etc/X11/xinit/xinitrc.d/50-systemd-user.sh &
# exec "gsettings org.gnome.desktop.interfaces color-scheme 'prefer-dark'" &
# export XDG_CURRENT_DESKTOP=Budgie:GNOME &

# Here i3 is kept as default
session=${1:-i3}

case $session in
	i3|i3wm		) exec i3;;
	qtile		) exec qtile start;;
	qtileWay	) exec qtile start -b wayland;;
	awesome|awm     ) exec awesome;;
	# cinnamon	) exec cinnamon-session;;
	# budgie	) budgie-dekstop
	# mate		) exec mate-session;;
	# No known session, try to run it as command
	*		) exec $1;;
esac
