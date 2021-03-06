run_startx=no
printf '%s (y/n): ' 'Run StartX?' 1>&2
read -t 60
case $REPLY in
[Yy]*) run_startx=yes ;;
esac

prepath=$prepath:$HOME/bin
prepath=$prepath:$HOME/sbin
prepath=$prepath:$HOME/xbin
prepath=$prepath:$HOME/.local/bin
prepath=$prepath:$HOME/.cabal/bin

for d in $HOME/lang/go $HOME/lang/go.ext; do
  # gopath => [external]:[personal]
  # path => [personal]:[external]
  gopath=$d:$gopath
  prepath=$prepath:$d/bin
done

prepath=$prepath:/usr/share/ghc-pristine/bin

postpath=$postpath:$HOME/.cargo/bin
postpath=$postpath:$HOME/.gem/ruby/2.5.0/bin
postpath=$postpath:$HOME/.gem/ruby/2.4.0/bin

gopath=${gopath%:}
prepath=${prepath#:}
postpath=${postpath#:}

set -a

DARCS_DO_COLOR_LINES=1
EDITOR=vi
GOPATH=$gopath
GOROOT=`go env GOROOT`
GPG_TTY=`tty`
LESSHISTFILE=/dev/null
MAKEOBJDIRPREFIX=$HOME/obj
PASSWORD_STORE_SIGNING_KEY=`cat $HOME/.secret/signing.key`
PATH=$prepath:$PATH:$postpath
SSH_AUTH_SOCK=$XDG_RUNTIME_DIR/ssh-agent.socket
XKB_DEFAULT_LAYOUT=us
XKB_DEFAULT_MODEL=pc105
XKB_DEFAULT_OPTIONS=compose:paus
XKB_DEFAULT_VARIANT=dvorak

set +a

test x$run_startx = xyes && exec startx
unset postpath prepath run_startx
