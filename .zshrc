# Environment
export PATH=$PATH:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/usr/bin/core_perl:/usr/lib/qt4/bin
export TERM=rxvt-256color
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
export GIT_MERGE_AUTOEDIT="no"
export LC_ALL="en_GB.utf8"
export BROWSER="google-chrome"
export EGL_PLATFORM="drm"
export LESSOPEN="| /usr/bin/source-highlight-esc.sh %s"
export CPLUS_INCLUDE_PATH=/usr/lib/gcc/x86_64-unknown-linux-gnu/4.8.2/include
export LESS=' -R '
export GTK_MODULES=rgba

# Includes
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

# Aliases
alias log="less /http/log"
alias vhc="/usr/bin/vhcn"
alias storm="~/storm/bin/phpstorm.sh"
alias chrome="sudo -u noname chromium"
alias poweroff="echo \"Good buy.\" && mysqltmpfsoff.sh && poweroff"
alias reboot="echo \"Good buy.\" && mysqltmpfsoff.sh && reboot"
alias mp="mplayer -ao alsa:device=dmixed -channels 6 "
alias o="xdg-open"
alias j="journalctl -r -u"
alias vpn="/opt/cisco/anyconnect/bin/vpn"
alias f="FBReader"
alias i="echo -e \"`cat ~/records/info`\""
alias s=geo_ssh
alias sr=systemctl restart
alias k=killall -9
alias sr="systemctl restart"
alias fe="feh -. -B black"
#alias m="mplayer -shuffle -playlist /home/noname/Downloads/pl"
#alias m2="mplayer -shuffle -playlist ~/pl2"
#alias pyfa="python2.7 ~/pyfa/pyfa.py"
#alias v="env GTK2_RC_FILES=/usr/share/themes/Cristal-Black\ 1.1/gtk-2.0/gtkrc gvim"
#alias gc="git diff --name-only --diff-filter=U"

#  Custom variables
c=/sources/c++
books=~/books
di=/http/dior-ipad
sk=/http/skimium/
skm=/http/skimium/sites/all/modules/
skt=/http/skimium/sites/all/themes/
os=/sources/linux_configs/
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="wedisagree"
ZSH_HIGHLIGHT_STYLES[globbing]=fg=253
ZSH_HIGHLIGHT_STYLES[pattern]=fg=253
ZSH_HIGHLIGHT_STYLES[history-expansion]=fg=white,underline
ZSH_HIGHLIGHT_STYLES[bracket-level-3]=fg=033
ZSH_HIGHLIGHT_STYLES[bracket-level-3]=fg=033
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND='bg=038,fg=white,bold'
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

# Start tmux session
if [ -z $TMUX ]
  then
    tmux
fi
