(
  packages=`pacaur -Qdqt` || exit 0
  pacaur -Rnsu $packages
)
