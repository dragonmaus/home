#!/bin/sh

go get -u ${1+"$@"} \
  golang.org/x/tools/cmd/fiximports \
  golang.org/x/tools/cmd/godoc \
  golang.org/x/tools/cmd/goimports \

test "$GOPATH"/bin/gofmt -ef "$GOPATH"/bin/goimports || ln -fv "$GOPATH"/bin/goimports "$GOPATH"/bin/gofmt
