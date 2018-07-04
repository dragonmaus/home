#!/bin/sh

set -e

cd "$HOME"

cabal=$HOME/.cabal
ghc=$HOME/.ghc
hackage=$HOME/.hackage

rm -fr $cabal $ghc $hackage
git diff -R --binary -- $cabal $ghc $hackage | git apply

src=$HOME/src/haskell

mkdir -pv $hackage/repo/package
ln -v $src/*/dist/*.tar.gz $hackage/repo/package

hackage-repo-tool create-keys --keys $hackage/keys
hackage-repo-tool bootstrap --keys $hackage/keys --repo $hackage/repo
hackage-repo-tool update --keys $hackage/keys --repo $hackage/repo

mkdir -pv $cabal/packages/local

cabal update

cabal install hscolour # must be installed first
cabal install `cat $cabal.world`
