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
alias gc="git diff --name-only --diff-filter=U"
alias se=systemctl
alias r=restart

#C++ configs

export CPLUS_INCLUDE_PATH=/usr/include:/usr/include/netinet:/usr/include/gphoto2:/usr/include/bits:/usr/include/FLAC++:/usr/include/speex:/usr/include/libwmf:/usr/include/libswscale:/usr/include/gdk-pixbuf-2.0:/usr/include/gtkspell-2.0:/usr/include/schroedinger-1.0:/usr/include/sane:/usr/include/freetype2:/usr/include/fribidi:/usr/include/python2.7:/usr/include/ijs:/usr/include/c++:/usr/include/sysfs:/usr/include/GLFW:/usr/include/avahi-client:/usr/include/neteconet:/usr/include/lirc:/usr/include/libsoup-gnome-2.4:/usr/include/gstreamer-0.10:/usr/include/openssl:/usr/include/lo:/usr/include/lua5.1:/usr/include/rpcsvc:/usr/include/Dt:/usr/include/libgtop-2.0:/usr/include/CLucene:/usr/include/mutils:/usr/include/avahi-ui:/usr/include/gstreamer-1.0:/usr/include/srchilite:/usr/include/sys:/usr/include/libxslt:/usr/include/httpd:/usr/include/gobject-introspection-1.0:/usr/include/enchant:/usr/include/ldns:/usr/include/nemiver:/usr/include/gssrpc:/usr/include/libgnomecanvasmm-2.6:/usr/include/FLAC:/usr/include/gtkhex-3:/usr/include/torrent:/usr/include/netash:/usr/include/jack:/usr/include/protocols:/usr/include/GL:/usr/include/xfs:/usr/include/pangomm-1.4:/usr/include/AL:/usr/include/sound:/usr/include/ghostscript:/usr/include/libdrm:/usr/include/libart-2.0:/usr/include/js:/usr/include/isl:/usr/include/pixman-1:/usr/include/OIS:/usr/include/serd-0:/usr/include/OGRE:/usr/include/gtkmm-3.0:/usr/include/libpng12:/usr/include/cdio:/usr/include/fuse:/usr/include/attr:/usr/include/gnu:/usr/include/netax25:/usr/include/fontembed:/usr/include/vdpau:/usr/include/lv2:/usr/include/sasl:/usr/include/gtk-2.0:/usr/include/systemd:/usr/include/gc:/usr/include/cairomm-1.0:/usr/include/cloog:/usr/include/ntfs-3g:/usr/include/polkit-1:/usr/include/lzma:/usr/include/xkbcommon:/usr/include/avahi-compat-libdns_sd:/usr/include/pci:/usr/include/uapi:/usr/include/libwnck-1.0:/usr/include/libavfilter:/usr/include/rpc:/usr/include/lzo:/usr/include/avahi-common:/usr/include/samba-4.0:/usr/include/gtk-1.2:/usr/include/pygtk-2.0:/usr/include/gudev-1.0:/usr/include/krb5:/usr/include/GLES:/usr/include/libgxps:/usr/include/pcap:/usr/include/nfs:/usr/include/dconf:/usr/include/net-snmp:/usr/include/libusb-1.0:/usr/include/gtksourceviewmm-3.0:/usr/include/fluidsynth:/usr/include/net:/usr/include/curl:/usr/include/gnome-keyring-1:/usr/include/mysql:/usr/include/GLES3:/usr/include/aubio:/usr/include/netipx:/usr/include/gio-unix-2.0:/usr/include/cupsfilters:/usr/include/netrose:/usr/include/gee-0.8:/usr/include/gail-3.0:/usr/include/cegui-0:/usr/include/netiucv:/usr/include/libgnomecanvas-2.0:/usr/include/evince:/usr/include/rdma:/usr/include/libnl3:/usr/include/gtk-unix-print-2.0:/usr/include/neon:/usr/include/vala-0.22:/usr/include/rasqal:/usr/include/graphviz:/usr/include/libsecret-1:/usr/include/lpsolve:/usr/include/nspr:/usr/include/KHR:/usr/include/OpenEXR:/usr/include/SDL:/usr/include/xcb:/usr/include/gee-1.0:/usr/include/mtd:/usr/include/security:/usr/include/cdio++:/usr/include/mp4v2:/usr/include/geoclue:/usr/include/avahi-qt3:/usr/include/datrie:/usr/include/qpdf:/usr/include/lqr-1:/usr/include/a52dec:/usr/include/opencore-amrwb:/usr/include/libavdevice:/usr/include/alsa:/usr/include/libavresample:/usr/include/librtmp:/usr/include/gsl:/usr/include/gconf:/usr/include/lame:/usr/include/jasper:/usr/include/ss:/usr/include/bsd:/usr/include/babl-0.1:/usr/include/libavformat:/usr/include/blkid:/usr/include/scsi:/usr/include/libavutil:/usr/include/lilv-0:/usr/include/gegl-0.2:/usr/include/cairo-dock:/usr/include/pulse:/usr/include/gdb:/usr/include/avahi-qt4:/usr/include/libgdl-3.0:/usr/include/speech-dispatcher:/usr/include/webkitgtk-3.0:/usr/include/gnutls:/usr/include/libbluray:/usr/include/libltdl:/usr/include/libpostproc:/usr/include/unique-3.0:/usr/include/layout:/usr/include/qt:/usr/include/fontconfig:/usr/include/openjpeg-1.5:/usr/include/webrtc_audio_processing:/usr/include/zzip:/usr/include/GLES2:/usr/include/libexslt:/usr/include/pango-1.0:/usr/include/netatalk:/usr/include/sord-0:/usr/include/graphite2:/usr/include/libdaemon:/usr/include/xorg:/usr/include/opus:/usr/include/mjpegtools:/usr/include/orc-0.4:/usr/include/ogg:/usr/include/gusb-1:/usr/include/libwps-0.2:/usr/include/json-c:/usr/include/gdkmm-2.4:/usr/include/sbc:/usr/include/linux:/usr/include/chicken:/usr/include/netpacket:/usr/include/boost:/usr/include/Mrm:/usr/include/gssglue:/usr/include/va:/usr/include/libswresample:/usr/include/libnotify:/usr/include/cppunit:/usr/include/gmime-2.6:/usr/include/Cg:/usr/include/yajl:/usr/include/webp:/usr/include/gtksourceview-3.0:/usr/include/rfb:/usr/include/libglade-2.0:/usr/include/p11-kit-1:/usr/include/pppd:/usr/include/proc:/usr/include/libwnck-3.0:/usr/include/ass:/usr/include/gdkmm-3.0:/usr/include/webkitgtk-1.0:/usr/include/pspell:/usr/include/libavcodec:/usr/include/libmodplug:/usr/include/ImageMagick-6:/usr/include/pygobject-3.0:/usr/include/et:/usr/include/startup-notification-1.0:/usr/include/gtk-3.0:/usr/include/ucd-snmp:/usr/include/gdlmm-3.0:/usr/include/dconf-dbus-1:/usr/include/avahi-compat-howl:/usr/include/vorbis:/usr/include/elfutils:/usr/include/arpa:/usr/include/libpng16:/usr/include/gdbm:/usr/include/at-spi2-atk:/usr/include/poppler:/usr/include/ruby-2.0.0:/usr/include/netrom:/usr/include/kadm5:/usr/include/hunspell:/usr/include/apr-1:/usr/include/vpx:/usr/include/xmlrpc-c:/usr/include/google:/usr/include/uil:/usr/include/unicode:/usr/include/atk-1.0:/usr/include/vala-0.18:/usr/include/gsettings-desktop-schemas:/usr/include/suil-0:/usr/include/asm-generic:/usr/include/libiptc:/usr/include/xen:/usr/include/libexif:/usr/include/rarian:/usr/include/libwpd-0.9:/usr/include/libspectre:/usr/include/avahi-core:/usr/include/cairo:/usr/include/libdv:/usr/include/glibmm-2.4:/usr/include/opencore-amrnb:/usr/include/at-spi-2.0:/usr/include/giomm-2.4:/usr/include/wx-2.8:/usr/include/libcroco-0.6:/usr/include/wine:/usr/include/pycairo:/usr/include/libIDL-2.0:/usr/include/libdjvu:/usr/include/theora:/usr/include/IL:/usr/include/nss:/usr/include/giblib:/usr/include/EGL:/usr/include/harfbuzz:/usr/include/php:/usr/include/raptor2:/usr/include/cairo-compmgr:/usr/include/js-17.0:/usr/include/e2p:/usr/include/libsoup-2.4:/usr/include/memcached:/usr/include/Xm:/usr/include/libmount:/usr/include/gimp-2.0:/usr/include/ext2fs:/usr/include/cddb:/usr/include/python3.3m:/usr/include/uuid:/usr/include/event2:/usr/include/acl:/usr/include/gtkglext-1.0:/usr/include/avahi-glib:/usr/include/readline:/usr/include/colord-1:/usr/include/gtkmm-2.4:/usr/include/video:/usr/include/synaptics:/usr/include/quota:/usr/include/gssapi:/usr/include/dbus-1.0:/usr/include/thai:/usr/include/tirpc:/usr/include/sigc++-2.0:/usr/include/glib-2.0:/usr/include/SILLY:/usr/include/vte-2.90:/usr/include/libxml2:/usr/include/X11:/usr/include/sratom-0:/usr/include/atkmm-1.6:/usr/include/rpcsecgss:/usr/include/ImageMagick:/usr/include/librsvg-2.0:/usr/include/libkms:/usr/include/nettle:/usr/include/gsm:/usr/include/gail-1.0:/usr/include/avahi-gobject:/usr/include/qt4:/usr/include/asm:/usr/include/cups:/usr/include/glib-1.2:/usr/include/editline:/usr/lib/atkmm-1.6/include:/usr/lib/cairomm-1.0/include:/usr/lib/dbus-1.0/include:/usr/lib/dbus-1.0/include/dbus:/usr/lib/gdkmm-2.4/include:/usr/lib/gdkmm-3.0/include:/usr/lib/gdlmm-3.0/include:/usr/lib/giomm-2.4/include:/usr/lib/glib-2.0/include:/usr/lib/glib/include:/usr/lib/glibmm-2.4/include:/usr/lib/gtk-2.0/include:/usr/lib/gtkglext-1.0/include:/usr/lib/gtkmm-2.4/include:/usr/lib/gtkmm-3.0/include:/usr/lib/gtksourceviewmm-3.0/include:/usr/lib/libffi-3.0.13/include:/usr/lib/libgnomecanvasmm-2.6/include:/usr/lib/pangomm-1.4/include:/usr/lib/sigc++-2.0/include:/usr/lib/wx/include:/usr/lib/wx/include/gtk2-unicode-release-2.8:
c=/sources/c++
export CPLUS_INCLUDE_PATH=/usr/lib/gcc/x86_64-unknown-linux-gnu/4.8.2/include
export GTK_MODULES=rgba
