setxkbmap -model "$XKB_DEFAULT_MODEL" -layout "$XKB_DEFAULT_LAYOUT" -variant "$XKB_DEFAULT_VARIANT" -option "$XKB_DEFAULT_OPTIONS"

set-wallpaper "$HOME"/Pictures/Wallpapers/.current

compton -b

redshift-gtk &

autocutsel -fork
autocutsel -fork -selection PRIMARY
autocutsel -fork -selection SECONDARY

xscreensaver &

gzip "$HOME"/.config/i3/session-*.log

exec i3 >"$HOME"/.config/i3/session-`date -u +%FT%T%:z`.log 2>&1
