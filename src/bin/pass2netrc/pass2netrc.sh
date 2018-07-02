#!/bin/sh
pass ${1+"$@"} | (
  read pass
  read user
  read host
  host=${host#*://}
  host=${host%%/*}
  printf 'machine %s login %s password %s\n' "$host" "$user" "$pass"
)
