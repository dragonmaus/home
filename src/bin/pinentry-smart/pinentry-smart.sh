#!/bin/sh

PINENTRY_GUI=/usr/bin/pinentry-gtk-2
PINENTRY_TTY=/usr/bin/pinentry-tty

if test x"$PINENTRY_USER_DATA" = xgui; then
  exec "$PINENTRY_GUI" ${1+"$@"}
else
  exec "$PINENTRY_TTY" ${1+"$@"}
fi
