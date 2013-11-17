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
alias m2="mplayer -shuffle -playlist ~/pl2"
alias fe="feh -. -B black"
alias pyfa="python2.7 ~/pyfa/pyfa.py"
alias j="journalctl -r -u"
alias f="FBReader"
alias v="env GTK2_RC_FILES=/usr/share/themes/Cristal-Black\ 1.1/gtk-2.0/gtkrc gvim"
os=/sources/linux_configs/
alias i="echo -e \"`cat ~/records/info`\""
alias s=geo_ssh
alias gc="git diff --name-only --diff-filter=U"
alias sr=systemctl restart

#C++ configs

alias k=killall -9
c=/sources/c++
export CPLUS_INCLUDE_PATH=/usr/lib/gcc/x86_64-unknown-linux-gnu/4.8.2/include
export GTK_MODULES=rgba
# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

ZSH_THEME="wedisagree"
#source ~/.oh-my-zsh/oh-my-zsh.sh

# Customize to your needs...
export PATH=$PATH:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/usr/bin/core_perl:/usr/lib/qt4/bin

# Override highlighter colors
#ZSH_HIGHLIGHT_STYLES[default]=none
#ZSH_HIGHLIGHT_STYLES[unknown-token]=fg=009
#ZSH_HIGHLIGHT_STYLES[reserved-word]=fg=009,standout
#ZSH_HIGHLIGHT_STYLES[alias]=fg=white,bold
#ZSH_HIGHLIGHT_STYLES[builtin]=fg=white,bold
#ZSH_HIGHLIGHT_STYLES[function]=fg=white,bold
#ZSH_HIGHLIGHT_STYLES[command]=fg=white,bold
#ZSH_HIGHLIGHT_STYLES[precommand]=fg=white,underline
#ZSH_HIGHLIGHT_STYLES[commandseparator]=none
#ZSH_HIGHLIGHT_STYLES[hashed-command]=fg=009
#ZSH_HIGHLIGHT_STYLES[path]=fg=214,underline
ZSH_HIGHLIGHT_STYLES[globbing]=fg=253
ZSH_HIGHLIGHT_STYLES[pattern]=fg=253
ZSH_HIGHLIGHT_STYLES[history-expansion]=fg=white,underline
#ZSH_HIGHLIGHT_STYLES[single-hyphen-option]=none
#ZSH_HIGHLIGHT_STYLES[double-hyphen-option]=none
#ZSH_HIGHLIGHT_STYLES[back-quoted-argument]=none
#ZSH_HIGHLIGHT_STYLES[single-quoted-argument]=fg=063
#ZSH_HIGHLIGHT_STYLES[double-quoted-argument]=fg=063
#ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]=fg=009
#ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]=fg=009
#ZSH_HIGHLIGHT_STYLES[assign]=none
ZSH_HIGHLIGHT_STYLES[bracket-level-3]=fg=033
ZSH_HIGHLIGHT_STYLES[bracket-level-3]=fg=033
source ~/.zsh-theme
alias sr="systemctl restart"

HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND='bg=038,fg=white,bold'
