#!/bin/sh

# Disable all outputs so that --auto will pick them up
for output in `xrandr | cut -d ' ' -f 1 | grep -Fvx -e Screen -e '' | sort -u`; do
  xrandr --output $output --off
done

# Reset all outputs to their preferred modes
exec xrandr --auto
