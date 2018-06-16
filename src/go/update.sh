#!/bin/sh

go get -u ${1+"$@"} \
  golang.org/x/tools/cmd/fiximports \
  golang.org/x/tools/cmd/godoc \
  golang.org/x/tools/cmd/goimports \

(IFS=:; for d in $GOPATH; do
  test -x $d/bin/goimports || continue
  test $d/bin/gofmt -ef $d/bin/goimports && continue
  ln -fv $d/bin/goimports $d/bin/gofmt
done)
