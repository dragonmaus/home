l=`pacaur -Qi linux | sed -n 's/^Version \+: //p'`
r=`pacaur -Si linux | sed -n 's/^Version \+: //p'`
c=`vercmp "$l" "$r"`
if test x"$c" = x-1; then
  echo "Linux kernel is outdated, please update!" 1>&2
  exit 0
fi
