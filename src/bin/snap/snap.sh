#!/bin/sh
exec fswebcam --config "$HOME/.config/fswebcam/snap.conf" ${1+"$@"}
