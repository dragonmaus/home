#!/bin/sh

tr / '\0' | sort ${1+"$@"} | tr '\0' /
