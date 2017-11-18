#!/bin/sh
exec env PINENTRY_USER_DATA=gui passmenu-otp ${1+"$@"}
