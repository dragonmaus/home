#!/bin/sh
exec dir-dlagent "dir://gog/${1#gog://}" "$2"
