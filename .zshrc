export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
export GIT_MERGE_AUTOEDIT="no"
export LC_ALL="en_GB.utf8"
export BROWSER="google-chrome"

#source ~/.git-completion.bash

alias log="cat /var/log/httpd/error.log"
alias storm="~/storm/bin/phpstorm.sh"
alias chrome="sudo -u noname chromium"
alias poweroff="echo \"Good buy.\" && mysqltmpfsoff.sh && poweroff"
alias reboot="echo \"Good buy.\" && mysqltmpfsoff.sh && reboot"
alias mp="mplayer -channels 6"
alias o="xdg-open"
books=~/books
le=/http/le360/public/
lem=/http/le360/public/sites/all/modules/
let=/http/le360/public/sites/all/themes/
cb=/http/culturebox/public/
cbm=/http/culturebox/public/sites/all/modules/
cbt=/http/culturebox/public/sites/all/themes/
o=/http/ofg/public/
om=/http/ofg/public/sites/all/modules/
ot=/http/ofg/public/sites/all/themes/
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

# create a zkbd compatible hash;
# to add other keys to this hash, see: man 5 terminfo
typeset -A key

#key[Home]=${terminfo[khome]}

#key[End]=${terminfo[kend]}
#key[Insert]=${terminfo[kich1]}
#key[Delete]=${terminfo[kdch1]}
#key[Up]=${terminfo[kcuu1]}
#key[Down]=${terminfo[kcud1]}
#key[Left]=${terminfo[kcub1]}
#key[Right]=${terminfo[kcuf1]}
#key[PageUp]=${terminfo[kpp]}
#key[PageDown]=${terminfo[knp]}

# setup key accordingly
#[[ -n "${key[Home]}"    ]]  && bindkey  "${key[Home]}"    beginning-of-line
#[[ -n "${key[End]}"     ]]  && bindkey  "${key[End]}"     end-of-line
#[[ -n "${key[Insert]}"  ]]  && bindkey  "${key[Insert]}"  overwrite-mode
#[[ -n "${key[Delete]}"  ]]  && bindkey  "${key[Delete]}"  delete-char
#[[ -n "${key[Up]}"      ]]  && bindkey  "${key[Up]}"      up-line-or-history
#[[ -n "${key[Down]}"    ]]  && bindkey  "${key[Down]}"    down-line-or-history
#[[ -n "${key[Left]}"    ]]  && bindkey  "${key[Left]}"    backward-char
#[[ -n "${key[Right]}"   ]]  && bindkey  "${key[Right]}"   forward-char
#
# Finally, make sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.
#if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
#    function zle-line-init () {
#        printf '%s' "${terminfo[smkx]}"
#    }
#    function zle-line-finish () {
#        printf '%s' "${terminfo[rmkx]}"
#    }
#    zle -N zle-line-init
#    zle -N zle-line-finish
#fi

di=/http/dior-ipad
export LESSOPEN="| /usr/bin/source-highlight-esc.sh %s"
export LESS=' -R '

pri=/http/pruban/sites/all/themes/front/images
sk=/http/skimium/
skm=/http/skimium/sites/all/modules/
skt=/http/skimium/sites/all/themes/

alias m="mplayer -shuffle -playlist /home/noname/Downloads/pl"
alias f="feh -. -B black"
alias pyfa="python2.7 ~/pyfa/pyfa.py"
alias j="journalctl -r -u"
alias f="FBReader"
alias v="env GTK2_RC_FILES=/usr/share/themes/Cristal-Black\ 1.1/gtk-2.0/gtkrc gvim"
os=/sources/linux_configs/
