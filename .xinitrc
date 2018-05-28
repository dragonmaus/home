setxkbmap -model "$XKB_DEFAULT_MODEL" -layout "$XKB_DEFAULT_LAYOUT" -variant "$XKB_DEFAULT_VARIANT" `for o in $XKB_DEFAULT_OPTIONS; do echo " -option $o"; done`

set-wallpaper "$HOME"/Pictures/Wallpapers/.current

compton -b

autocutsel -fork
autocutsel -fork -selection PRIMARY
autocutsel -fork -selection SECONDARY
caffeine &
env KEYBASE_START_UI=hideWindow run_keybase 1>/dev/null 2>&1 &
redshift-gtk &
xscreensaver &

gzip "$HOME"/.config/i3/session-*.log

exec i3 >"$HOME"/.config/i3/session-`date -u +%FT%TZ`.log 2>&1
