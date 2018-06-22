#!/bin/sh
exec clojure --init "$HOME"/.profile.clj --repl ${1+"$@"} \
  --depend dragon libs 1.0.0-SNAPSHOT jar
