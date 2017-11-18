#!/bin/sh

set -e

echo() {
  printf '%s\n' "$*"
}

file=.gitignore

test -f $file || touch $file
rm -f $file{tmp}
for f do echo "$f"; done | cat - $file | sort -u >$file{tmp}
rm -f $file{new}
(grep -v '^!' <$file{tmp} || :; grep '^!' <$file{tmp} || :) >$file{new}
rm -f $file{tmp}
chmod 600 $file{new}
fsync $file{new}
cmp -s $file $file{new} && rm -f $file{new} || mv -f $file{new} $file
