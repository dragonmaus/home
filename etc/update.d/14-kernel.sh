l=`pacaur -Qi linux | sed -n 's/^Version \+: //p'`
r=`pacaur -Si linux | sed -n 's/^Version \+: //p'`
c=`vercmp "$l" "$r"`
vertab() {
  printf '%s\t%c\t%s\n' local ' ' remote "$1" "$2" "$3" | column -s '	' -t
}
echo "Checking kernel version…" 1>&2
case $c in
  -1)
    vertab $l '<' $r 1>&2
    echo "Linux kernel is outdated, please update!" 1>&2
    exit 0
    ;;
  0)
    vertab $l '=' $r 1>&2
    echo "Linux kernel is up-to-date!" 1>&2
    ;;
  1)
    vertab $l '>' $r 1>&2
    echo "Future kernel detected!" 1>&2
    ;;
esac
