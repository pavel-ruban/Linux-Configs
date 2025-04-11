# Environment
export PATH=$PATH:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/usr/bin/core_perl:/usr/lib/qt4/bin
export TERM=rxvt-256color
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
export GIT_MERGE_AUTOEDIT="no"
export LC_ALL="en_GB.utf8"
#export LC_ALL="ru_RU.koi8r"
export BROWSER="google-as-noname.sh"
#export BROWSER="firefox"
export EGL_PLATFORM="drm"
export NODE_PATH=/usr/lib/node_modules
export LESSOPEN="| /usr/bin/source-highlight-esc.sh %s"
export CPLUS_INCLUDE_PATH=/usr/lib/gcc/x86_64-unknown-linux-gnu/4.8.2/include
export LESS=' -R '
export GTK_MODULES=rgba
export WINEARCH='win32'
export WINEPREFIX=/root/.wine32
export USE_ZEND_ALLOC=0
export _JAVA_AWT_WM_NONREPARENTING=1
export OPENSCADPATH=/sources/geda
export BROWSER_BIN=chromium
export KISYSMOD=/usr/share/kicad/modules
export ZPLUG_HOME=/usr/share/zsh/scripts/zplug
export ALSOFT_LOGLEVEL=0
export ALSOFT_LOGFILE=/dev/null
#export VRCOMPOSITOR_LD_LIBRARY_PATH=/home/noname/.local/share/Steam/steamapps/common/SteamVR:/home/noname/.local/share/Steam/steamapps/common/SteamVR/bin/linux64:/home/noname/.local/share/Steam/steamapps/common/SteamVR/bin/linux64:/home/noname/.local/share/Steam/steamapps/common/SteamVR/bin/linux64/qt/lib:/home/noname/.local/share/Steam/steamapps/common/SteamVR/bin/linux64:/home/noname/.local/share/Steam/ubuntu12_32/steam-runtime/pinned_libs_32:/home/noname/.local/share/Steam/ubuntu12_32/steam-runtime/pinned_libs_64:/usr/lib/libfakeroot:/usr/lib32:/usr/lib:/home/noname/.local/share/Steam/ubuntu12_32/steam-runtime/lib/i386-linux-gnu:/home/noname/.local/share/Steam/ubuntu12_32/steam-runtime/usr/lib/i386-linux-gnu:/home/noname/.local/share/Steam/ubuntu12_32/steam-runtime/lib/x86_64-linux-gnu:/home/noname/.local/share/Steam/ubuntu12_32/steam-runtime/usr/lib/x86_64-linux-gnu:/home/noname/.local/share/Steam/ubuntu12_32/steam-runtime/lib:/home/noname/.local/share/Steam/ubuntu12_32/steam-runtime/usr/lib
source /usr/share/zsh/scripts/zplug/init.zsh

# Includes
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

# Aliases
alias n="sudo -u noname"
alias ny="sudo -u noname yay"
alias log="less /hosts/log"
alias vhc="/usr/bin/vhcn"
alias storm="~/storm/bin/phpstorm.sh"
alias chrome="sudo -u noname chromium"
alias poweroff="echo \"Good bye.\" && mysqltmpfsoff.sh && poweroff"
alias reboot="echo \"Good bye.\" && mysqltmpfsoff.sh && reboot"
alias mp="mplayer -ao alsa:device=dmixed -channels 6 "
alias o="xdg-open"
alias j="journalctl -r -u"
alias weechat="env TERM=screen-256color weechat"
alias vpn="/opt/cisco/anyconnect/bin/vpn"
alias f="FBReader"
alias i="echo -e \"`cat ~/records/info`\""
#alias s=geo_ssh
alias s=systemctl
alias sr=systemctl restart
alias k=killall -9
alias sr="systemctl restart"
alias fe="feh -. -B black"
alias la="ls -lath --color=always | less -R"
alias grep="grep --color=always"
alias less="less -R"
alias m=make
alias git="TZ=UTC git"
alias eve="mount /dev/sda2 /mnt/data; n WINEARCH=win32 WINEPREFIX=/home/noname/.wine32 wine /mnt/data/Games/Eve\ online/eve.exe"

#alias m="mplayer -shuffle -playlist /home/noname/Downloads/pl"
#alias m2="mplayer -shuffle -playlist ~/pl2"
#alias pyfa="python2.7 ~/pyfa/pyfa.py"
#alias v="env GTK2_RC_FILES=/usr/share/themes/Cristal-Black\ 1.1/gtk-2.0/gtkrc gvim"
#alias gc="git diff --name-only --diff-filter=U"

#  Custom variables
c=/sources/c++
books=~/books
avr=/sources/avr
di=/http/dior-ipad
sk=/http/skimium/
s=/sources/c++/silk-cpp-engine
skm=/http/skimium/sites/all/modules/
skt=/http/skimium/sites/all/themes/
ke=/sources/kernel/linux
sa=/http/sas/
os=/sources/linux_configs/
ge=/sources/geda/prjs/
ki=/sources/kicad/
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="wedisagree"
ZSH_HIGHLIGHT_STYLES[globbing]=fg=253
ZSH_HIGHLIGHT_STYLES[pattern]=fg=253
ZSH_HIGHLIGHT_STYLES[history-expansion]=fg=white,underline
ZSH_HIGHLIGHT_STYLES[bracket-level-3]=fg=033
ZSH_HIGHLIGHT_STYLES[bracket-level-3]=fg=033
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND='bg=038,fg=white,bold'
HISTFILE=~/.zsh_history
SAVEHIST=10000000
HISTSIZE=10000000
PATH=$PATH:/vendor/bin/
ALSOFT_LOGLEVEL=0
ALSOFT_LOGFILE=/dev/null
ALSOFT_LOGPATH=/dev/null

setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.
setopt HIST_BEEP                 # Beep when accessing nonexistent history.
## Override highlighter colors
##ZSH_HIGHLIGHT_STYLES[default]=none
##ZSH_HIGHLIGHT_STYLES[unknown-token]=fg=009
##ZSH_HIGHLIGHT_STYLES[reserved-word]=fg=009,standout
##ZSH_HIGHLIGHT_STYLES[alias]=fg=white,bold
##ZSH_HIGHLIGHT_STYLES[builtin]=fg=white,bold
##ZSH_HIGHLIGHT_STYLES[function]=fg=white,bold
##ZSH_HIGHLIGHT_STYLES[command]=fg=white,bold
##ZSH_HIGHLIGHT_STYLES[precommand]=fg=white,underline
##ZSH_HIGHLIGHT_STYLES[commandseparator]=none
##ZSH_HIGHLIGHT_STYLES[hashed-command]=fg=009
##ZSH_HIGHLIGHT_STYLES[path]=fg=214,underline

# create a zkbd compatible hash;
# to add other keys to this hash, see: man 5 terminfo
typeset -A key


alias chrome="setsid sudo -u noname google-chrome-beta  > /dev/null 2>&1 < /dev/null"
export ERL_LIBS=/root/Erlang
ad=/http/adememot/
adm=/http/adememot/sites/all/modules/
adt=/http/adememot/sites/all/themes/
si=/http/siis/
sim=/http/siis/sites/all/modules/
sit=/http/siis/sites/all/themes/
#export LUA_PATH="/usr/share/lua/5.3/debugger/?.lua;/usr/share/lua/5.3/?.lua;/usr/share/awesome/lib/?.lua;/usr/lib/lua/5.3/?.so;/usr/lib/lua/5.3/?.lua"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/noname/Downloads/google-cloud-sdk/path.zsh.inc' ]; then source '/home/noname/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/noname/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then source '/home/noname/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
ma=/projects/Matchtech/webapp/public/
mam=/projects/Matchtech/webapp/public/sites/all/modules/
mat=/projects/Matchtech/webapp/public/sites/all/themes/
oe=/projects/oebv/_www/
oem=/projects/oebv/_www/sites/all/modules/
oet=/projects/oebv/_www/sites/all/themes/
ip=/projects/odp/web/
ipm=/projects/odp/web/sites/all/modules/
ipt=/projects/odp/web/sites/all/themes/
function blt() {
  if [[ ! -z ${AH_SITE_ENVIRONMENT} ]]; then
    PROJECT_ROOT="/var/www/html/${AH_SITE_GROUP}.${AH_SITE_ENVIRONMENT}"
  elif [ "`git rev-parse --show-cdup 2> /dev/null`" != "" ]; then
    PROJECT_ROOT=$(git rev-parse --show-cdup)
  else
    PROJECT_ROOT="."
  fi

  if [ -f "$PROJECT_ROOT/vendor/bin/blt" ]; then
    $PROJECT_ROOT/vendor/bin/blt "$@"

  # Check for local BLT.
  elif [ -f "./vendor/bin/blt" ]; then
    ./vendor/bin/blt "$@"

  else
    echo "You must run this command from within a BLT-generated project."
    return 1
  fi
}

export LIBVA_DRIVER_NAME=vdpau

# Plugins
plugins=(... osx zsh-history-substring-search)

source ~/.oh-my-zsh/plugins/osx/osx.plugin.zsh
[[ -n $DISPLAY ]] && xmodmap ~/.Xmodmap > /dev/null 2>&1
[[ -n $DISPLAY ]] && sudo -u noname xmodmap ~/.Xmodmap > /dev/null 2>&1


# ----------- hack to fix the broken history-substring-search plugin --------- #
bindkey "^[[A" history-substring-search-up
bindkey "^[[B" history-substring-search-down

# Start tmux session
if [ -n $DISPLAY ] && [ -z $TMUX ]
  then
#    tmux
fi

# ----------- hack to fix the broken history-substring-search plugin --------- #
bindkey "^[[A" history-substring-search-up
bindkey "^[[B" history-substring-search-down
export EDITOR=vim
#xhost si:localuser:root
#xhost si:localuser:noname

NONAME_UID=`id -u noname`

if [ ! -d "/var/run/dbus" ]; then
	mkdir /var/run/dbus
	chown noname:noname /var/run/dbus

fi

if [ -e "/var/run/dbus/$UID-sessionbus.pid" ]; then
	DBUS_SESSION_BUS_PID=`cat /var/run/dbus/${UID}-sessionbus.pid`
fi

if [ -e "/var/run/dbus/$UID-sessionbus.address" ]; then
	DBUS_SESSION_BUS_ADDRESS=`cat /var/run/dbus/${UID}-sessionbus.address`
fi
# start the dbus as session bus and save the enviroment vars
if [ -z ${DBUS_SESSION_BUS_PID+x} ]; then
        echo start session dbus ...
        eval "export $(/usr/bin/dbus-launch)"
        echo "${DBUS_SESSION_BUS_PID}" > /var/run/dbus/${UID}-sessionbus.pid
        echo "${DBUS_SESSION_BUS_ADDRESS}" > /var/run/dbus/${UID}-sessionbus.address
        echo session dbus runs now at pid="${DBUS_SESSION_BUS_PID}"
else
        echo session dbus runs at pid="${DBUS_SESSION_BUS_PID}"
        export DBUS_SESSION_BUS_ADDRESS=$DBUS_SESSION_BUS_ADDRESS DBUS_SESSION_BUS_PID=$DBUS_SESSION_BUS_PID
fi
