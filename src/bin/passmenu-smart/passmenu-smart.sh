#!/bin/sh
exec env PINENTRY_USER_DATA=gui passmenu ${1+"$@"}
