#!/bin/sh
exec runjava --depend org.clojure clojure 1.8.0 jar --main clojure.main ${1+"$@"}
