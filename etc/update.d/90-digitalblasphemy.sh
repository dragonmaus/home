(
  file=1600x1200.zip
  pass web/com.digitalblasphemy \
    | tr '\n' '\t' \
    | sort \
    | sed 's/^\(.*\)\t\(.*\)\thttp:\/\/\(.*\)\/\t$/machine secure.\3 login \2 password \1/' \
    | curl \
      --netrc-file /dev/fd/0 \
      --output "$HOME"/Downloads/"$file" \
      --remote-time \
      --time-cond "$HOME"/Downloads/"$file" \
      --url https://secure.digitalblasphemy.com/content/zips/"$file"
)
