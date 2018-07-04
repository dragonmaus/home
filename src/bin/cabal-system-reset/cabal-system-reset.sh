#!/bin/sh

cd "$HOME"

rm -fr "$HOME/.cabal"
rm -fr "$HOME/.ghc"

git diff -R --binary -- "$HOME/.cabal" "$HOME/.ghc" | git apply

cabal update

for p in `cat "$HOME/.cabal.world"`; do
  test -d "$p" && (cd "$p" && exec cabal clean)
done

cabal install hscolour # must be installed first
cabal install `cat "$HOME/.cabal.world"`
