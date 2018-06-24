#!/bin/sh

if test -d "$1"; then
  echo "\"$1\" already exists, aborting" 1>&2
  exit 1
fi

mkdir -pv "$1"
cd "$1"

git init

rm -fv .git/hooks/*.sample

realPWD=`env - PATH=$PATH pwd`
realGOPATH=`cd "$HOME"/src/go && env - PATH=$PATH pwd`

case "$realPWD" in
  $realGOPATH/*)
    ln -fv "$realGOPATH"/misc/git/hooks/* .git/hooks/
    ;;
esac
