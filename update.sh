#!/bin/sh

set -e

d=$HOME/etc/update.d

for i in `ls "$d"`; do
  f=$d/$i
  test -f "$f" && test -r "$f" && . "$f"
done
