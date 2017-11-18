#!/bin/sh

set -e

tar=`which bsdtar tar 2>/dev/null | head -1`

mkdir -p "$2"

(cd "$1"; exec find . -print0) |
(cd "$1"; exec $tar -cn -f - -T - --no-fflags --no-xattrs --null) |
(cd "$2"; exec $tar -xp -f - --no-fflags --no-xattrs)
