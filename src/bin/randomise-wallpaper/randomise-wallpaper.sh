#!/bin/sh

cd "$HOME"/Pictures/Wallpapers

current=`readlink .current`
random=$current

while test x"$random" = x"$current"; do
  random=`ls -F | grep -v '@$' | shuf | head -1`
done

ln -fs "$random" .current
