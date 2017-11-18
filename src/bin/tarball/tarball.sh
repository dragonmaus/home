#!/bin/sh -e

. $HOME/lib/stdlib.sh

findopts=
zipopts=
taropts=
zip=
opts=123456789Xbgsvx

usage() (die 100 usage "tarball [-$opts] path")

while getopts $opts opt; do
  case $opt in
  1|2|3|4|5|6|7|8|9)
    zipopts=$zipopts$o
    ;;
  X)
    zip=.xz
    ;;
  b)
    zip=.bz2
    ;;
  g)
    zip=.gz
    ;;
  s|x)
    findopts=$findopts$o
    ;;
  v)
    zipopts=$zipopts$o
    taropts=$taropts$o
    ;;
  *)
    usage
    ;;
  esac
done
shift `expr $OPTIND - 1`
test x"$1" = x && usage

test -e "$1" || die 111 fatal "$1: No such file or directory"

case $zip in
.bz2)
  zip() (exec bzip2 ${1+"$@"})
  ;;
.gz)
  zip() (exec gzip -n ${1+"$@"})
  ;;
.xz)
  zip() (exec xz ${1+"$@"})
  ;;
*)
  zip() (exec cat)
  ;;
esac

first=yes
for dir; do
  if test x$first = xyes; then
    first=no
  else
    echo 1>&2
  fi

  out=$dir.tar$zip
  echo "Creating $out..." 1>&2

  rm -f "$out"{new}

  find "$dir" -print0 \
  | tr '/' '\1' \
  | sort -z \
  | tr '\1' '/' \
  | bsdtar -cn$taropts -T - -f - --null \
  | zip -c$zipopts \
  > "$out"{new}

  touch -ch -r "$dir" "$out"{new}
  fsync "$out"{new}

  mv -f "$out"{new} "$out"
done
