(
  grpfile=$HOME/etc/pacman/groups
  pkgfile=$HOME/etc/pacman/packages
  xargs pacaur -Qgq <"$grpfile" | sort -u | xargs pacaur -D --asdeps 1>/dev/null 2>&1
  rm -f "$pkgfile"{new}
  pacaur -Qeq | sort -u >"$pkgfile"{new}
  fsync "$pkgfile"{new}
  if cmp -s "$pkgfile"{new} "$pkgfile"; then
    rm -f "$pkgfile"{new}
  else
    mv -f "$pkgfile"{new} "$pkgfile"
  fi
  xargs pacaur -Qgq <"$grpfile" | sort -u | xargs pacaur -D --asexplicit 1>/dev/null 2>&1
)
