#!/bin/sh

mkdir -pv "$1"
cd "$1"

git init

rm -fv .git/hooks/*.sample

realPWD=`env - PATH=$PATH pwd`
case "$realPWD" in
  $HOME/src/go/*)
    ln -fv $HOME/src/go/misc/git/hooks/* .git/hooks/
    ;;
  $HOME/src/haskell/*)
    git ignore '/dist/'
    git ignore '/dist-newstyle/'
    ;;
  $HOME/src/rust/*)
    git ignore '/target/'
    git ignore '*.rs.bk'
    ;;
esac
