#!/bin/sh

set -e

cd "$HOME"

cabal=$HOME/.cabal
ghc=$HOME/.ghc
hackage=$HOME/.hackage

rm -fr $cabal $ghc
rm -f $hackage/repo/*
rm -fr $hackage/repo/index
git diff -R --binary -- $cabal $ghc $hackage | git apply

src=$HOME/src/haskell/src

mkdir -pv $hackage/repo/package
ln -fv $src/*/dist/*.tar.gz $hackage/repo/package

hackage-repo-tool create-keys --keys $hackage/keys
hackage-repo-tool bootstrap --keys $hackage/keys --repo $hackage/repo
hackage-repo-tool update --keys $hackage/keys --repo $hackage/repo

mkdir -pv $cabal/packages/local

cabal update

packages=`cat $cabal.world`
for package in $packages; do
  case $package in /*) ;; *) continue ;; esac
  test -d $package || continue
  (cd $package && exec cabal clean)
done

cabal install hscolour # must be installed first
cabal install $packages
