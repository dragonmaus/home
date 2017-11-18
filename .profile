set -a

EDITOR=vi
GOPATH=`go env GOPATH`
GPG_TTY=`tty`
LESSHISTFILE=/dev/null
MAKEOBJDIRPREFIX=$HOME/obj
PATH=$PATH:$HOME/bin:$HOME/sbin:$HOME/xbin:$GOPATH/bin:$HOME/.local/bin:$HOME/.gem/ruby/2.4.0/bin
SSH_AUTH_SOCK=$XDG_RUNTIME_DIR/ssh-agent.socket

XKB_DEFAULT_LAYOUT=us
XKB_DEFAULT_MODEL=thinkpad
XKB_DEFAULT_VARIANT=dvorak
XKB_DEFAULT_OPTIONS=ctrl:swapcaps

set +a

case $LOGNAME in
*-)
  set -a
  eval `printenv | sed -n s/$LOGNAME/${LOGNAME%-}/gp`
  exec startx
  ;;
esac
