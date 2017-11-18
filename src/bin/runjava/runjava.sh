#!/bin/sh

repository=$HOME/.m2/repository

addpath=
optmain=
optpath=

addpath() {
  if test x"$addpath" != x; then
    addpath=$addpath:$1
  else
    addpath=$1
  fi
}

timestamp=`date`
set -- ${1+"$@"} ">>$timestamp<<"
while :; do
  opt=$1
  shift

  case $opt in
  ">>$timestamp<<")
    break
    ;;
  -c|--classpath)
    addpath "$1"
    shift
    ;;
  -d|--depend)
    g=`echo "$1" | tr . /`
    addpath "$repository/$g/$2/$3/$2-$3.$4"
    shift 4
    ;;
  -h|--help)
    cat <<END
usage: runjava [-c path[:path[:…]]] [-d group artifact version packaging]
               [-m mainclass] [args…]

  -c, --classpath  Add the paths to the beginning of CLASSPATH.
  -d, --depend     Add a Maven artifact to the beginning of CLASSPATH.
  -m, --main       Specify the main entry point.
  args             Remaining arguments are passed to the main class.

-c and -d may be specified multiple times; entries will be added to
the beginning of CLASSPATH in the order given.
END
    exit 0
    ;;
  -m|--main)
    optmain=$1
    shift
    ;;
  *)
    set -- ${1+"$@"} "$opt"
    ;;
  esac
done

if test x"$addpath" != x; then
  if test x"$CLASSPATH" != x; then
    CLASSPATH=$addpath:$CLASSPATH
  else
    CLASSPATH=$addpath
  fi
fi

export CLASSPATH

exec java "$optmain" ${1+"$@"}
