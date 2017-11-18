#!/bin/sh
exec zbarimg -q --raw ${1+"$@"}
