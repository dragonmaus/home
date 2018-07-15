#!/bin/sh

mkdir -pv "$1"
cd "$1"

git init

rm -fv .git/hooks/*.sample

realPWD=`env - PATH=$PATH pwd`
case "$realPWD/" in
  $HOME/lang/go/*)
    ln -fv $HOME/lang/go/misc/git/hooks/* .git/hooks/
    ;;
  $HOME/lang/haskell/*)
    git ignore '/dist/'
    git ignore '/dist-newstyle/'
    ;;
  $HOME/lang/rust/*)
    git ignore '/target/'
    git ignore '*.rs.bk'
    ;;
esac
