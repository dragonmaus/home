#!/bin/sh

set -e

echo() {
  printf '%s\n' "$*"
}

file=.gitattributes

test -f $file || touch $file
rm -f $file{new}
for f do echo "$f" filter=git-crypt diff=git-crypt; done | cat - $file | sort -u >$file{new}
chmod 600 $file{new}
fsync $file{new}
cmp -s $file $file{new} && rm -f $file{new} || mv -f $file{new} $file
