#!/bin/sh
env PINENTRY_USER_DATA=gui pass show $1 | sed -n 1p
