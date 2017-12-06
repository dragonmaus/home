#!/bin/sh
gpg2 --list-packets "$1" 1>/dev/null 2>&1 || exec cat "$1"
exec git-decrypt <"$1"
