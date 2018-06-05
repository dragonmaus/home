run_startx=no
printf '%s (y/n): ' 'Run StartX?' 1>&2
read -t 60
case $REPLY in
[Yy]*) run_startx=yes ;;
esac

set -a

EDITOR=vi
GOPATH=`go env GOPATH`
GPG_TTY=`tty`
LESSHISTFILE=/dev/null
MAKEOBJDIRPREFIX=$HOME/obj
PATH=$HOME/.cargo/bin:$PATH:$HOME/bin:$HOME/sbin:$HOME/xbin:$GOPATH/bin:$HOME/.local/bin:$HOME/.gem/ruby/2.4.0/bin
SSH_AUTH_SOCK=$XDG_RUNTIME_DIR/ssh-agent.socket

XKB_DEFAULT_LAYOUT=us
XKB_DEFAULT_MODEL=thinkpad
XKB_DEFAULT_OPTIONS=compose:paus
XKB_DEFAULT_VARIANT=dvorak

PASSWORD_STORE_SIGNING_KEY=`cat $HOME/.secret/signing.key`

set +a

test x$run_startx = xyes && exec startx
unset run_startx
