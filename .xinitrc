export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
#export XDG_CONFIG_HOME="/usr/share/themes/Zukitwo"
export BROWSER="sudo -u noname chromium"
#[[ ! -z "`xrandr | grep 'VGA1 connected'`" ]] && xrandr --output VGA1 --rotate normal --auto --output HDMI1 --primary --auto --left-of VGA1 && feh --bg-fill ~/linux.jpg
#exec cube&
#exec conky&
#exec cairo-dock&
#exec gnome-session
#exec /sources/c++/a.out
echo $DBUS_SESSION_BUS_ADDRESS > /tmp/DBUS_SESSION_BUS_ADDRESS
#exec xrandr --dpi 110&
#exec xbindkeys -p
#exec xterm
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
#if [ -f $HOME/.Xmodmap ]; then
#    /usr/bin/xmodmap $HOME/.Xmodmap
#fi

#if tail -n 40 /proc/cpuinfo  | grep "^model name" | grep "AMD Phenom(tm) II X4 945 Processor"
	#then xrandr --dpi 130
#fi

[ -f ~/.xprofile ] && . ~/.xprofile
exec awesome
