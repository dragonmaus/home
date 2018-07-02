(
  base=https://secure.digitalblasphemy.com/content/zips
  path=$HOME/Downloads
  for res in 1600x900 1600x1200 1920x1080 3840x1080; do
    file=$path/$res.zip
    url=$base/$res.zip
    case `file -b --mime-type "$file"` in
      application/zip) ;;
      *) touch -r /etc/epoch "$file" ;;
    esac
    echo curl "$url" '=>' "$file" 1>&2
    pass2netrc web/com.digitalblasphemy \
    | curl \
      --netrc-file /dev/fd/0 \
      --output "$file" \
      --remote-time \
      --time-cond "$file" \
      --url "$url"
  done
)
