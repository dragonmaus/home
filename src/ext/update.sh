#!/bin/sh

set -e

base=`dirname "$0"`
base=`cd "$base" && env - "PATH=$PATH" pwd`
cd "$base"

git ls-files '*.uri' | sed 's/\.uri$//' | pathsort | while IFS= read repo; do
  echo "Repository $base/$repo:"
  if ! test -d "$repo"; then
    uri=`head -1 <"$repo".uri`
    git clone "$uri" "$repo"
  fi
  git -C "$repo" pull
done
